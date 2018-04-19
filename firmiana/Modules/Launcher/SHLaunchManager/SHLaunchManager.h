//
//  SHLaunchManager.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TLTabBarController/TLTabBarController.h>

@interface SHLaunchManager : NSObject


/// 当前根控制器
@property (nonatomic, strong, readonly) __kindof UIViewController *curRootVC;

/// 根tabBarController
@property (nonatomic, strong, readonly) TLTabBarController *tabBarController;

+ (SHLaunchManager *)sharedInstance;

/**
 *  启动，初始化
 */
- (void)launchInWindow:(UIWindow *)window;


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

