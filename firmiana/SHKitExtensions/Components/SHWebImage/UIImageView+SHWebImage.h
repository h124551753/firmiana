//
//  UIImageView+SHWebImage.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, SHWebImageOptions) {
    /**
     * 失败重试（默认）
     */
    SHWebImageRetryFailed = 1 << 0,
    /**
     * 低优先级的（在scrollView滑动时不下载，减速时开始下载）
     */
    SHWebImageLowPriority = 1 << 1,
    /**
     * 仅内存缓存
     */
    SHWebImageCacheMemoryOnly = 1 << 2,
    /**
     * 渐进式下载（如浏览器，下载一截展示一截）
     */
    SHWebImageProgressiveDownload = 1 << 3,
    /**
     * 重新下载，更新缓存
     */
    SHWebImageRefreshCached = 1 << 4,
    /**
     * 开始后台下载（比如app进入后台，仍然下载）
     */
    SHWebImageContinueInBackground = 1 << 5,
    /**
     * 可以控制存在NSHTTPCookieStore的cookies.
     */
    SHWebImageHandleCookies = 1 << 6,
    /**
     * 允许无效的ssl证书
     */
    SHWebImageAllowInvalidSSLCertificates = 1 << 7,
    /**
     * 高优先级，会放在队头下载
     */
    SHWebImageHighPriority = 1 << 8,
    /**
     * 延时展示占位图（图片下载失败时才展示）
     */
    SHWebImageDelayPlaceholder = 1 << 9,
    /**
     * 动图相关（猜测）
     */
    SHWebImageTransformAnimatedImage = 1 << 10,
    /**
     * 图片下载完成之后不自动给imageView设置
     */
    SHWebImageAvoidAutoSetImage = 1 << 11,
    /**
     * 根据设备屏幕类型，进行放大缩小（@1x, @2x, @3x）
     */
    SHWebImageScaleDownLargeImages = 1 << 12
};

typedef NS_ENUM(NSInteger, SHImageCacheType) {
    /**
     * 无缓存
     */
    SHImageCacheTypeNone,
    /**
     * 磁盘缓存
     */
    SHImageCacheTypeDisk,
    /**
     * 内存缓存
     */
    SHImageCacheTypeMemory
};

typedef void (^SHWebImageDownloadCompleteBlock)(UIImage *image, NSError *error, SHImageCacheType cacheType, NSURL *imageURL);
typedef void (^SHWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize, NSURL *targetURL);

@interface UIImageView (SHWebImage)

- (void)tt_setImageWithURL:(NSURL *)url;
- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options;
- (void)tt_setImageWithURL:(NSURL *)url completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setImageWithURL:(NSURL *)url options:(SHWebImageOptions)options completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options progress:(SHWebImageDownloaderProgressBlock)progressBlock completed:(SHWebImageDownloadCompleteBlock)completedBlock;

- (void)tt_cancelCurrentImageLoad;

@end
