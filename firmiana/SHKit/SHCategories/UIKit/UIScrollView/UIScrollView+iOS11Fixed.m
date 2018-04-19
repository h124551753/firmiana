//
//  UIScrollView+iOS11Fixed.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UIScrollView+iOS11Fixed.h"

@implementation UIScrollView (iOS11Fixed)

- (void)setNeverAdjustmentContentInset:(BOOL)neverAdjustmentContentInset
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
#endif
}
- (BOOL)neverAdjustmentContentInset
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        return self.contentInsetAdjustmentBehavior;
    }
#endif
    return NO;
}

@end
