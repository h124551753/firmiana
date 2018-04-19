//
//  SHAppConfig.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHAppConfig.h"
#import "SHAddMenuItem.h"

@implementation SHAppConfig


+ (SHAppConfig *)sharedConfig
{
    static SHAppConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc] init];
    });
    return config;
}

#pragma mark - # Private Methos
- (SHAddMenuItem *)p_getMenuItemByType:(SHAddMneuType)type
{
    switch (type) {
        case SHAddMneuTypeGroupChat:        // 群聊
            return [SHAddMenuItem createWithType:SHAddMneuTypeGroupChat title:LOCSTR(@"发起群聊") iconPath:@"nav_menu_groupchat" className:@""];
            break;
        case SHAddMneuTypeAddFriend:        // 添加好友
            return [SHAddMenuItem createWithType:SHAddMneuTypeAddFriend title:LOCSTR(@"添加朋友") iconPath:@"nav_menu_addfriend" className:@"SHAddContactsViewController"];
            break;
        case SHAddMneuTypeWallet:           // 收付款
            return [SHAddMenuItem createWithType:SHAddMneuTypeWallet title:LOCSTR(@"收付款") iconPath:@"nav_menu_wallet" className:@"SHWalletViewController"];
            break;
        case SHAddMneuTypeScan:             // 扫一扫
            return [SHAddMenuItem createWithType:SHAddMneuTypeScan title:LOCSTR(@"扫一扫") iconPath:@"nav_menu_scan" className:@"SHScanningViewController"];
            break;
        default:
            break;
    }
    return nil;
}

#pragma mark - # Getters
- (NSString *)version
{
    NSString *shortVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *buildID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *version = [NSString stringWithFormat:@"%@ (%@)", shortVersion, buildID];
    
    return version;
}

- (NSArray *)addMenuItems
{
    if (!_addMenuItems) {
        return @[[self p_getMenuItemByType:0],
                 [self p_getMenuItemByType:1],
                 [self p_getMenuItemByType:2],
                 [self p_getMenuItemByType:3],];
    }
    return _addMenuItems;
}

@end
