//
//  SHMenuItem.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHMenuItem.h"
#import <TLTabBarController/TLBadge.h>

SHMenuItem *createMenuItem(NSString *icon, NSString *title)
{
    SHMenuItem *item = [[SHMenuItem alloc] init];
    [item setIconName:icon];
    [item setTitle:title];
    return item;
}

@implementation SHMenuItem

- (void)setBadge:(NSString *)badge
{
    _badge = badge;
    _badgeSize = [TLBadge badgeSizeWithValue:badge];
}

- (void)setRightIconURL:(NSString *)rightIconURL withRightIconBadge:(BOOL)rightIconBadge
{
    [self setRightIconURL:rightIconURL];
    [self setShowRightIconBadge:rightIconBadge];
}

- (BOOL)showRightIconBadge
{
    if (!self.rightIconURL) {
        return NO;
    }
    return _showRightIconBadge;
}

@end
