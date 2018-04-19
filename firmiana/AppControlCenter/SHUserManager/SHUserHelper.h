//
//  SHUserHelper.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHUser.h"

@interface SHUserHelper : NSObject


@property (nonatomic, strong) SHUser *user;

@property (nonatomic, strong, readonly) NSString *userID;

@property (nonatomic, assign, readonly) BOOL isLogin;

+ (SHUserHelper *)sharedHelper;

- (void)loginTestAccount;

@end
