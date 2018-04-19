//
//  SHUserHelper.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHUserHelper.h"
#import "SHDBUserStore.h"

@implementation SHUserHelper
@synthesize user = _user;

+ (SHUserHelper *)sharedHelper
{
    static SHUserHelper *helper;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        helper = [[SHUserHelper alloc] init];
    });
    return helper;
}

- (void)loginTestAccount
{
    SHUser *user = [[SHUser alloc] init];
    user.userID = @"1000";
    user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
    user.nikeName = @"李伯坤";
    user.username = @"li-bokun";
    
    [self setUser:user];
}

- (SHUser *)user
{
    if (!_user) {
        if (self.userID.length > 0) {
            SHDBUserStore *userStore = [[SHDBUserStore alloc] init];
            _user = [userStore userByID:self.userID];
            if (!_user) {
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginUid"];
            }
        }
    }
    return _user;
}


- (BOOL)isLogin
{
    return self.user.userID.length > 0;
}

@end
