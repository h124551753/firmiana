//
//  SHDeallocTask.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHDeallocTask.h"

#pragma mark - ## SHDeallocTaskItem
@interface SHDeallocTaskItem : NSObject

@property (nonatomic, weak, readonly) id target;
@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, copy, readonly) SHDeallocBlock task;

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(SHDeallocBlock)task;

@end

@implementation SHDeallocTaskItem

- (instancetype)initWithTarget:(id)target key:(NSString *)key task:(SHDeallocBlock)task
{
    self = [super init];
    if (self) {
        _target = target;
        _key = key;
        _task = [task copy];
    }
    return self;
}

- (BOOL)isEqual:(SHDeallocTaskItem *)object
{
    if (object == self) {
        return YES;
    }
    else if ([object isKindOfClass:[self class]] && [object.target isEqual:self.target] && [object.key isEqualToString:self.key]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return ([self.target hash] + self.key.hash) / 2;
}

@end

#pragma mark - ## SHDeallocTask
@interface SHDeallocTask ()

@property (nonatomic, strong) NSMutableSet<SHDeallocTaskItem *> *taskSet;

@end

@implementation SHDeallocTask

- (id)init
{
    if (self = [super init]) {
        self.taskSet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [self.taskSet enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(SHDeallocTaskItem *obj, BOOL *stop) {
        obj.task ? obj.task() : nil;
    }];
}

#pragma mark - # Public Methods
- (void)addTask:(SHDeallocBlock)task forTarget:(id)target key:(NSString *)key
{
    SHDeallocTaskItem *taskItem = [[SHDeallocTaskItem alloc] initWithTarget:target key:key task:task];
    if ([self.taskSet containsObject:taskItem]) {
        [self.taskSet removeObject:taskItem];
    }
    [self.taskSet addObject:taskItem];
}

- (void)removeTaskForTarget:(id)target key:(NSString *)key
{
    SHDeallocTaskItem *taskItem = [[SHDeallocTaskItem alloc] initWithTarget:target key:key task:nil];
    [self.taskSet removeObject:taskItem];
}

@end
