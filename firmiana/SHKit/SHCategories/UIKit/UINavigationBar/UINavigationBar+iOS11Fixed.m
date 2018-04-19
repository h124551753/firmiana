//
//  UINavigationBar+iOS11Fixed.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UINavigationBar+iOS11Fixed.h"
#import <objc/runtime.h>

@implementation UINavigationBar (iOS11Fixed)

+ (void)load
{
    Method oldMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method newMethod = class_getInstanceMethod(self, @selector(tt_layoutSubviews));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)tt_layoutSubviews
{
    [self tt_layoutSubviews];
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending) {
        self.layoutMargins = UIEdgeInsetsZero;
        for (UIView *view in self.subviews) {
            if ([NSStringFromClass(view.class) containsString:@"ContentView"]) {
                view.layoutMargins = UIEdgeInsetsZero;
                break;
            }
        }
    }
}

@end
