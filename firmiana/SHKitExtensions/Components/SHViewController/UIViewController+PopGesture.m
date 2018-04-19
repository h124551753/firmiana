//
//  UIViewController+PopGesture.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UIViewController+PopGesture.h"

#pragma mark - ## UINavigationController (SHViewController)

@interface UINavigationController (SHViewController)

@property (nonatomic, strong, readonly) id systemInteractivePopGestureRecognizerDelegate;

@end

@implementation UINavigationController (SHViewController)

+ (void)load
{
    SHExchangeMethod(@selector(initWithRootViewController:), @selector(__tt_initWithRootViewController:))
}

- (id)__tt_initWithRootViewController:(UIViewController *)rootViewController
{
    [self __tt_initWithRootViewController:rootViewController];
    [self setAssociatedObject:self.interactivePopGestureRecognizer.delegate forKey:@"systemInteractivePopGestureRecognizerDelegate" association:SHAssociationStrong];
    return self;
}

- (id)systemInteractivePopGestureRecognizerDelegate
{
    return [self associatedObjectForKey:@"systemInteractivePopGestureRecognizerDelegate"];
}

@end

@implementation UIViewController (PopGesture)

+ (void)load
{
    SHExchangeMethod(@selector(viewWillAppear:), @selector(__tt_viewWillAppear:))
}

- (void)__tt_viewWillAppear:(BOOL)animated
{
    [self __tt_viewWillAppear:animated];
    
    if ([self.navigationController.childViewControllers containsObject:self]) {
        if (self.disablePopGesture) {
            if ([self.navigationController respondsToSelector:@selector(systemInteractivePopGestureRecognizerDelegate)]) {
                self.navigationController.interactivePopGestureRecognizer.delegate = self;
            }
            else {
                NSLog(@"不能禁用右滑手势");
            }
        }
        else {
            if ([self.navigationController respondsToSelector:@selector(systemInteractivePopGestureRecognizerDelegate)]) {
                id delegate = [self.navigationController valueForKey:@"systemInteractivePopGestureRecognizerDelegate"];
                if (delegate && self.navigationController.interactivePopGestureRecognizer.delegate != delegate) {
                    self.navigationController.interactivePopGestureRecognizer.delegate = delegate;
                }
            }
        }
    }
}

#pragma mark - # Public Methods
- (void)setDisablePopGesture:(BOOL)disablePopGesture
{
    [self setAssociatedObject:@(disablePopGesture) forKey:@"__tt_disablePopGesture" association:SHAssociationAssign];
    if (disablePopGesture && [self.navigationController.childViewControllers containsObject:self]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}
- (BOOL)disablePopGesture
{
    return [[self associatedObjectForKey:@"__tt_disablePopGesture"] boolValue];
}

#pragma mark - # Delegate
//MARK: UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return NO;
}

@end
