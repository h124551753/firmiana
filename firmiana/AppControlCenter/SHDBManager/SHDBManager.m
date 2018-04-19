//
//  SHDBManager.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHDBManager.h"
#import "SHUserHelper.h"
#import "NSFileManager+Firmiana.h"

static SHDBManager *manager;

@implementation SHDBManager

+ (SHDBManager *)sharedInstance
{
    static dispatch_once_t once;
    NSString *userID = [SHUserHelper sharedHelper].userID;
    dispatch_once(&once, ^{
        manager = [[SHDBManager alloc] initWithUserID:userID];
    });
    return manager;
}

- (id)initWithUserID:(NSString *)userID
{
    if (self = [super init]) {
        NSString *commonQueuePath = [NSFileManager pathDBCommon];
        self.commonQueue = [FMDatabaseQueue databaseQueueWithPath:commonQueuePath];
        NSString *messageQueuePath = [NSFileManager pathDBMessage];
        self.messageQueue = [FMDatabaseQueue databaseQueueWithPath:messageQueuePath];
    }
    return self;
}

- (id)init
{
    DDLogError(@"TLDBManager：请使用 initWithUserID: 方法初始化");
    return nil;
}

@end
