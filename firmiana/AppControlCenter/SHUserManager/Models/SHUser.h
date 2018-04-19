//
//  SHUser.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHUser : NSObject

/// 用户ID
@property (nonatomic, strong) NSString *userID;

/// 用户名
@property (nonatomic, strong) NSString *username;

/// 昵称
@property (nonatomic, strong) NSString *nikeName;

/// 头像URL
@property (nonatomic, strong) NSString *avatarURL;

/// 头像Path
@property (nonatomic, strong) NSString *avatarPath;

/// 备注名
@property (nonatomic, strong) NSString *remarkName;

/// 界面显示名称
@property (nonatomic, strong, readonly) NSString *showName;

@end
