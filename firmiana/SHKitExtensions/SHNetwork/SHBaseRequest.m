//
//  SHBaseRequest.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHBaseRequest.h"

@implementation SHBaseRequest


- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion
{    
    SHWeakSelf(self);
    [[SHRequestManager sharedManager] GET:URLString parameters:parameters completion:^(SHBaseResponse *response) {
        
        if (!weakself) {
            return ;
        }
                
        !completion ?: completion(response);
        
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion
{
    SHWeakSelf(self);
    [[SHRequestManager sharedManager] POST:URLString parameters:parameters completion:^(SHBaseResponse *response) {
        
        if (!weakself) {
            return ;
        }
        
        !completion ?: completion(response);
        
    }];
}

- (void)PUT:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion
{
    SHWeakSelf(self);
    [[SHRequestManager sharedManager] PUT:URLString parameters:parameters completion:^(SHBaseResponse *response) {
        
        if (!weakself) {
            return ;
        }
        
        !completion ?: completion(response);
        
    }];
}

- (void)DELETE:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion
{
    SHWeakSelf(self);
    [[SHRequestManager sharedManager] DELETE:URLString parameters:parameters completion:^(SHBaseResponse *response) {
        
        if (!weakself) {
            return ;
        }
        
        !completion ?: completion(response);
        
    }];
}


@end
