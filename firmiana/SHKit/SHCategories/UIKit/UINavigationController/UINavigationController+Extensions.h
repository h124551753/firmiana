//
//  UINavigationController+Extensions.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Extensions)

/// 跟控制器
@property (nonatomic, strong, readonly) UIViewController *rootViewController;

/// 是不是只有rootVC
@property (nonatomic, assign, readonly) BOOL isOnlyContainRootViewController;

/**
 *  从nav堆栈里找指定class的VC
 */
- (id)findViewController:(NSString*)className;

/**
 *  pop到指定的viewcontroler
 *
 *  @param className 指定viewcontroler类名
 *  @param animated  是否动画
 *
 *  @return pop之后的viewcontrolers
 */
- (NSArray *)popToViewControllerWithClassName:(NSString*)className animated:(BOOL)animated;

/**
 *  pop n层
 *
 *  @param level  n层
 *  @param animated  是否动画
 *
 *  @return pop之后的viewcontrolers
 */
- (NSArray *)popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;


/**
 *  自杀式push
 *
 *  从A push到B后，销毁A
 */
- (void)pushViewControllerAndSuicide:(UIViewController *)viewController animated:(BOOL)animated;


@end
