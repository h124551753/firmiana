//
//  NSNotificationCenter+MainThread.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "NSNotificationCenter+MainThread.h"

@implementation NSNotificationCenter (MainThread)

- (void)postNotificationOnMainThread:(NSNotification *)notification
{
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object
{
    NSNotification *notification = [NSNotification notificationWithName:name object:object];
    [self postNotificationOnMainThread:notification];
}

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object userInfo:(NSDictionary *)aUserInfo
{
    NSNotification *notification = [NSNotification notificationWithName:name object:object userInfo:aUserInfo];
    [self postNotificationOnMainThread:notification];
}

@end
