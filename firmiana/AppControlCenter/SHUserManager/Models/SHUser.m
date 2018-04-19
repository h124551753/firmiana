//
//  SHUser.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHUser.h"

@implementation SHUser


- (id)init
{
    if (self = [super init]) {
        [SHUser mj_setupObjectClassInArray:^NSDictionary *{
            return @{ @"detailInfo" : @"TLUserDetail",
                      @"userSetting" : @"TLUserSetting",
                      @"chatSetting" : @"TLUserChatSetting",};
        }];
    }
    return self;
}

@end
