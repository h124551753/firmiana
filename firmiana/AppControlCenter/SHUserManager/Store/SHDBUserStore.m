//
//  SHDBUserStore.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHDBUserStore.h"
#import "SHDBUserStoreSQL.h"


@implementation SHDBUserStore


- (id)init
{
    if (self = [super init]) {
        self.dbQueue = [SHDBManager sharedInstance].commonQueue;
        BOOL ok = [self createTable];
        if (!ok) {
            DDLogError(@"DB: 用户表创建失败");
        }
    }
    return self;
}

- (BOOL)createTable
{
    NSString *sqlString = [NSString stringWithFormat:SQL_CREATE_USER_TABLE, USER_TABLE_NAME];
    return [self createTable:USER_TABLE_NAME withSQL:sqlString];
}


- (BOOL)updateUser:(SHUser *)user
{
    NSString *sqlString = [NSString stringWithFormat:SQL_UPDATE_USER, USER_TABLE_NAME];
    NSArray *arrPara = [NSArray arrayWithObjects:
                        SHNoNilString(user.userID),
                        SHNoNilString(user.username),
                        SHNoNilString(user.nikeName),
                        SHNoNilString(user.avatarURL),
                        SHNoNilString(user.remarkName),
                        @"", @"", @"", @"", @"", nil];
    BOOL ok = [self excuteSQL:sqlString withArrParameter:arrPara];
    return ok;
}

- (SHUser *)userByID:(NSString *)userID
{
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_USER_BY_ID, USER_TABLE_NAME, userID];
    __block SHUser * user;
    [self excuteQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            user = [self p_createUserByFMResultSet:retSet];
        }
        [retSet close];
    }];
    return user;
}

- (NSArray *)userData
{
    __block NSMutableArray *data = [[NSMutableArray alloc] init];
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_USERS, USER_TABLE_NAME];
    
    [self excuteQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            SHUser *user = [self p_createUserByFMResultSet:retSet];
            [data addObject:user];
        }
        [retSet close];
    }];
    
    return data;
}

- (BOOL)deleteUsersByUid:(NSString *)uid
{
    NSString *sqlString = [NSString stringWithFormat:SQL_DELETE_USER, USER_TABLE_NAME, uid];
    BOOL ok = [self excuteSQL:sqlString, nil];
    return ok;
}

#pragma mark - # Private Methods
- (SHUser *)p_createUserByFMResultSet:(FMResultSet *)retSet
{
    SHUser *user = [[SHUser alloc] init];
    user.userID = [retSet stringForColumn:@"uid"];
    user.username = [retSet stringForColumn:@"username"];
    user.nikeName = [retSet stringForColumn:@"nikename"];
    user.avatarURL = [retSet stringForColumn:@"avatar"];
    user.remarkName = [retSet stringForColumn:@"remark"];
    return user;
}

@end
