//
//  SHSDKManager.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHSDKManager : NSObject


+ (SHSDKManager *)sharedInstance;

/**
 *  启动，初始化
 */
- (void)launchInWindow:(UIWindow *)window;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
