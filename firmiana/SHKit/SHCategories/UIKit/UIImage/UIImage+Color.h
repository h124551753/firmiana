//
//  UIImage+Color.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)imageWithColor:(UIColor *)color;

// 灰色图像
- (UIImage *)grayImage;

@end
