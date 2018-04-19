//
//  SHDBUserStore.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHDBBaseStore.h"
#import "SHUser.h"
#import "SHKit.h"

@interface SHDBUserStore : SHDBBaseStore


/**
 *  更新用户信息
 */
- (BOOL)updateUser:(SHUser *)user;

/**
 *  获取用户信息
 */
- (SHUser *)userByID:(NSString *)userID;

/**
 *  查询所有用户
 */
- (NSArray *)userData;

/**
 *  删除用户
 */
- (BOOL)deleteUsersByUid:(NSString *)uid;

@end
