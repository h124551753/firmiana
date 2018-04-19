//
//  UIViewController+NavBar.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+Action.h"

@interface UIViewController (NavBar)

/// 添加消失BarButton（左侧)
- (void)addDismissBarButtonWithTitle:(NSString *)title;

/// 左侧文字BarButton
- (void)addLeftBarButtonWithTitle:(NSString *)title actionBlick:(SHBarButtonActionBlock)actionBlock;
/// 左侧图片BarButton
- (void)addLeftBarButtonWithImage:(UIImage *)image actionBlick:(SHBarButtonActionBlock)actionBlock;

/// 右侧文字BarButton
- (void)addRightBarButtonWithTitle:(NSString *)title actionBlick:(SHBarButtonActionBlock)actionBlock;
/// 右侧图片BarButton
- (void)addRightBarButtonWithImage:(UIImage *)image actionBlick:(SHBarButtonActionBlock)actionBlock;

@end
