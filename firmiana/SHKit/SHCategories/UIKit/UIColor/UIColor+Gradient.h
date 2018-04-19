//
//  UIColor+Gradient.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Gradient)

/**
 *  渐变颜色
 *
 *  @param fromColor    开始颜色
 *  @param toColor      结束颜色
 *  @param height       渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)gradientColorFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(int)height;

@end
