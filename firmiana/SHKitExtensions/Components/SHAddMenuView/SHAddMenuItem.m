//
//  SHAddMenuItem.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHAddMenuItem.h"

@implementation SHAddMenuItem

+ (SHAddMenuItem *)createWithType:(SHAddMneuType)type title:(NSString *)title iconPath:(NSString *)iconPath className:(NSString *)className
{
    SHAddMenuItem *item = [[SHAddMenuItem alloc] init];
    item.type = type;
    item.title = title;
    item.iconPath = iconPath;
    item.className = className;
    return item;
}

@end
