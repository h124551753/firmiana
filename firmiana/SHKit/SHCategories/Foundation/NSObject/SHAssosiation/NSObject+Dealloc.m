//
//  NSObject+Dealloc.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "NSObject+Dealloc.h"
#import <objc/runtime.h>
#import "SHDeallocTask.h"

static const char kTask = '0';

@implementation NSObject (Dealloc)

- (void)addDeallocTask:(SHDeallocBlock)deallocTask forTarget:(id)target key:(NSString *)key
{
    [self.deallocTask addDeallocTask:deallocTask forTarget:target key:key];
}

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key
{
    [self.deallocTask removeDeallocTaskForTarget:target key:key];
}

#pragma mark - # Getters
- (SHDeallocTask *)deallocTask
{
    SHDeallocTask *task = objc_getAssociatedObject(self, &kTask);
    if (!task) {
        task = [[SHDeallocTask alloc] init];
        objc_setAssociatedObject(self, &kTask, task, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return task;
}

@end
