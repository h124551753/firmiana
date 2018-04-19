//
//  UIButton+SHWebImage.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+SHWebImage.h"

@interface UIButton (SHWebImage)

- (void)tt_setImageWithURL:(NSURL *)url forState:(UIControlState)state;
- (void)tt_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;
- (void)tt_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options;
- (void)tt_setImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setImageWithURL:(NSURL *)url
                  forState:(UIControlState)state
          placeholderImage:(UIImage *)placeholder
                   options:(SHWebImageOptions)options
                 completed:(SHWebImageDownloadCompleteBlock)completedBlock;

- (void)tt_cancelImageLoadForState:(UIControlState)state;

#pragma mark - # BackgroundImage
- (void)tt_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state;
- (void)tt_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;
- (void)tt_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options;
- (void)tt_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SHWebImageDownloadCompleteBlock)completedBlock;
- (void)tt_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SHWebImageOptions)options completed:(SHWebImageDownloadCompleteBlock)completedBlock;

- (void)tt_cancelBackgroundImageLoadForState:(UIControlState)state;
@end
