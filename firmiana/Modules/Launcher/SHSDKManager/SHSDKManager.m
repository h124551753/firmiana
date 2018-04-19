//
//  SHSDKManager.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHSDKManager.h"

@implementation SHSDKManager


+ (SHSDKManager *)sharedInstance
{
    static SHSDKManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)launchInWindow:(UIWindow *)window
{
    // 友盟统计
//    [MobClick startWithAppkey:UMENG_APPKEY reportPolicy:BATCH channelId:APP_CHANNEL];
    
    // Mob SMS
    //    [SMSSDK registerApp:MOB_SMS_APPKEY withSecret:MOB_SMS_SECRET];
    
    // 日志
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
//    [DDLog addLogger:[DDASLLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
}

@end
