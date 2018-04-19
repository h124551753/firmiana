//
//  NSTimer+Block.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))inBlock repeats:(BOOL)repeats
{
    void (^block)(NSTimer *timer) = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(tt_timeBlock:) userInfo:block repeats:repeats];
    return ret;
}

+ (id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))inBlock repeats:(BOOL)repeats
{
    void (^block)(NSTimer *timer) = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(tt_timeBlock:) userInfo:block repeats:repeats];
    return ret;
}

+ (void)tt_timeBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[inTimer userInfo];
        block(self);
    }
}

@end
