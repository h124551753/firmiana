//
//  SHSettingItem.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHSettingItem.h"

@implementation SHSettingItem

+ (SHSettingItem *)createItemWithTitle:(NSString *)title
{
    SHSettingItem *item = [[SHSettingItem alloc] init];
    item.title = title;
    return item;
}

- (id)init
{
    if (self = [super init]) {
        self.showDisclosureIndicator = YES;
    }
    return self;
}

- (NSString *) cellClassName
{
    switch (self.type) {
        case SHSettingItemTypeDefalut:
            return @"SHSettingCell";
            break;
        case SHSettingItemTypeTitleButton:
            return @"SHSettingButtonCell";
            break;
        case SHSettingItemTypeSwitch:
            return @"SHSettingSwitchCell";
            break;
        default:
            break;
    }
    return nil;
}

@end
