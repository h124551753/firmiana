//
//  UIButton+Extensions.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SHButtonImagePosition) {
    SHButtonImagePositionLeft = 0,              //图片在左，文字在右，默认
    SHButtonImagePositionRight = 1,             //图片在右，文字在左
    SHButtonImagePositionTop = 2,               //图片在上，文字在下
    SHButtonImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (Extensions)

/**
 *  设置Button的背景色
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/**
 *  快捷设置图片
 */
- (void)setImage:(UIImage *)image imageHL:(UIImage *)imageHL;


/**
 *  image和title图文混排
 *
 *  @param  position    图片的位置，默认left
 *  @param  spacing     图片和标题的间隔
 *
 *  @return     返回button最小的size
 *
 *  注意，需要先设置好image、title、font。网络图片需要下载完成后再调用此方法，或设置同大小的placeholder
 */
- (CGSize)setButtonImagePosition:(SHButtonImagePosition)position spacing:(CGFloat)spacing;

@end
