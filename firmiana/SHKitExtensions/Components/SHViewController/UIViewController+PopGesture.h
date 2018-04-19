//
//  UIViewController+PopGesture.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopGesture) <UIGestureRecognizerDelegate>

/// 禁用手势返回（默认为NO）
@property (nonatomic, assign) BOOL disablePopGesture;

@end
