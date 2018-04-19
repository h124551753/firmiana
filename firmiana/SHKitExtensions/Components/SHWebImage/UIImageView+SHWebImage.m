//
//  UIImageView+SHWebImage.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UIImageView+SHWebImage.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (SHWebImage)

- (void)tt_setImageWithURL:(NSURL *)url
{
    [self tt_setImageWithURL:url completed:nil];
}

- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self tt_setImageWithURL:url placeholderImage:placeholder completed:nil];
}

- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options
{
    [self tt_setImageWithURL:url placeholderImage:placeholder options:options completed:nil];
}

- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SHWebImageDownloadCompleteBlock)completedBlock
{
     [self tt_setImageWithURL:url placeholderImage:placeholder options:nil completed:completedBlock];
}

- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options completed:(SHWebImageDownloadCompleteBlock)completedBlock
{
    [self tt_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)tt_setImageWithURL:(NSURL *)url completed:(SHWebImageDownloadCompleteBlock)completedBlock
{
    [self tt_setImageWithURL:url placeholderImage:nil completed:completedBlock];
}

- (void)tt_setImageWithURL:(NSURL *)url options:(SHWebImageOptions)options completed:(SHWebImageDownloadCompleteBlock)completedBlock
{
    [self tt_setImageWithURL:url placeholderImage:nil options:options progress:nil completed:completedBlock];
}

- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options progress:(SHWebImageDownloaderProgressBlock)progressBlock completed:(SHWebImageDownloadCompleteBlock)completedBlock
{
    [self sd_setImageWithURL:url placeholderImage:placeholder options:(SDWebImageOptions)options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (progressBlock) {
            progressBlock(receivedSize, expectedSize, nil);
        }
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (completedBlock) {
            completedBlock(image, error, (SHImageCacheType)cacheType, imageURL);
        }
    }];
}

- (void)tt_cancelCurrentImageLoad
{
    [self sd_cancelCurrentImageLoad];
}

@end
