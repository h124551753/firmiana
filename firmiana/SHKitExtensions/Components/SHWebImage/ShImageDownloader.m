//
//  SHImageDownloader.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHImageDownloader.h"
#import <SDWebImage/SDWebImageDownloader.h>
#import <SDWebImage/SDImageCache.h>

#pragma mark - ## SHImageDownloaderTask
typedef NS_ENUM(NSInteger, SHImageDownloadState) {
    SHImageDownloadStateNone,
    SHImageDownloadStateDownloading,
    SHImageDownloadStateComplete,
};

@interface SHImageDownloaderTask : NSObject

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, copy) void (^completeAction)(BOOL, UIImage *);
@property (nonatomic, strong) NSString *token;
@property (nonatomic, assign) SHImageDownloadState downloadState;
@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) UIImage *image;

- (id)initWithUrl:(NSURL *)url completeAction:(void (^)(BOOL, UIImage *))completeAction;

@end

@implementation SHImageDownloaderTask

- (id)initWithUrl:(NSURL *)url completeAction:(void (^)(BOOL, UIImage *))completeAction
{
    if (self = [super init]) {
        [self setUrl:url];
        [self setCompleteAction:completeAction];
    }
    return self;
}

@end

#pragma mark - ## SHImageDownloader
@interface SHImageDownloader ()

/// 当前下载任务
@property (nonatomic, strong) NSMutableArray<SHImageDownloaderTask *> *downloadTasks;
/// 历史记录
@property (nonatomic, strong) NSMutableArray<SHImageDownloaderTask *> *historyRecord;

@end

@implementation SHImageDownloader

- (void)addDownloadTaskWithUrl:(NSString *)urlString completeAction:(void (^)(BOOL, UIImage *))completeAction
{
    NSURL *url = SHURL(urlString);
    
    // 已经成功下载
    SHImageDownloaderTask *task = [self historyDownloadTaskByUrl:url.absoluteString];
    if (task.success && task.image) {
        [task setDownloadState:SHImageDownloadStateComplete];
        [task setCompleteAction:completeAction];
    }
    else {
        task = [[SHImageDownloaderTask alloc] initWithUrl:url completeAction:completeAction];
        UIImage *image = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:url.absoluteString];
        if (!image) {
            image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:url.absoluteString];
        }
        if (image) {
            [task setDownloadState:SHImageDownloadStateComplete];
            [task setSuccess:YES];
            [task setImage:image];
        }
    }
    [self.downloadTasks addObject:task];
}

- (void)startDownload
{
    for (SHImageDownloaderTask *task in self.downloadTasks) {
        if (task.success && task.image) {
            continue;
        }
        @weakify(self);
        task.downloadState = SHImageDownloadStateDownloading;
        task.token = [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:task.url options:SDWebImageDownloaderHighPriority progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            @strongify(self);
            if (!self) {
                return;
            }
            
            task.downloadState = SHImageDownloadStateComplete;
            if (finished && image && !error) {
                [task setSuccess:YES];
                [task setImage:image];
            }
            else {
                [task setSuccess:NO];
                [task setImage:nil];
            }
            [self downloadComplete:task];
        }];
    }
    if (self.downloadTasks.count > 0) {
        SHImageDownloaderTask *firstTask = self.downloadTasks.firstObject;
        if (firstTask.success && firstTask.image) {
            [self downloadComplete:firstTask];
        }
    }
}

- (void)cancelDownload
{
    for (SHImageDownloaderTask *task in self.downloadTasks) {
//        [[SDWebImageDownloader sharedDownloader] cancel:task.token];
    }
    [self.downloadTasks removeAllObjects];
}

#pragma mark - # Private Methods
/// 根据url获取任务
- (SHImageDownloaderTask *)historyDownloadTaskByUrl:(NSString *)url
{
    for (SHImageDownloaderTask *task in self.historyRecord) {
        if ([task.url.absoluteString isEqualToString:url]) {
            return task;
        }
    }
    return nil;
}

/// 下载完成
- (void)downloadComplete:(SHImageDownloaderTask *)task
{
    if (task == self.downloadTasks.firstObject) {
        [self.downloadTasks removeObject:task];
        if (task.completeAction) {
            task.completeAction(task.success, task.image);
            if (task.success) {
                [self.historyRecord addObject:task];
                [[SDImageCache sharedImageCache] storeImage:task.image forKey:task.url.absoluteString toDisk:YES];
            }
        }
        if (self.downloadTasks.count > 0 && self.downloadTasks.firstObject.downloadState == SHImageDownloadStateComplete) {
            [self downloadComplete:self.downloadTasks.firstObject];
        }
    }
}

#pragma mark - # Getters
- (NSMutableArray<SHImageDownloaderTask *> *)downloadTasks
{
    if (!_downloadTasks) {
        _downloadTasks = [[NSMutableArray alloc] init];
    }
    return _downloadTasks;
}

- (NSMutableArray<SHImageDownloaderTask *> *)historyRecord
{
    if (!_historyRecord) {
        _historyRecord = [[NSMutableArray alloc] init];
    }
    return _historyRecord;
}

- (NSInteger)curTaskCount
{
    return self.downloadTasks.count;
}

@end
