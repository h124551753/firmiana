//
//  UICollectionViewCell+Extensions.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UICollectionViewCell+Extensions.h"

@implementation UICollectionViewCell (Extensions)

- (void)setSelectedBackgrounColor:(UIColor *)selectedBackgrounColor
{
    if (selectedBackgrounColor) {
        UIView *selectedBGView = [[UIView alloc] init];
        [selectedBGView setBackgroundColor:selectedBackgrounColor];
        [self setSelectedBackgroundView:selectedBGView];
    }
    else {
        [self setSelectedBackgroundView:nil];
    }
}
- (UIColor *)selectedBackgrounColor
{
    return self.selectedBackgroundView.backgroundColor;
}

@end
