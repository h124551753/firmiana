//
//  NSNotificationCenter+MainThread.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (MainThread)

- (void)postNotificationOnMainThread:(NSNotification *)notification;

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object;

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object userInfo:(NSDictionary *)aUserInfo;

@end
