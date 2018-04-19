//
//  UIView+Screenshot.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

/**
 *  截屏
 *
 *  线程安全的
 */
- (UIImage *)captureImage;

@end
