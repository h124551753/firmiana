//
//  UITabBarController+TLPush.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UITabBarController+SHPush.h"

@implementation UITabBarController (SHPush)

- (BOOL)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.selectedIndex < self.childViewControllers.count) {
        UIViewController *vc = self.childViewControllers[self.selectedIndex];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController *)vc pushViewController:viewController animated:animated];
            return YES;
        }
    }
    return NO;
}

@end
