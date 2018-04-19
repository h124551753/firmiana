//
//  UIColor+Extensions.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (Extensions)

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(float)alpha;

/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)RandomColor;

@end
