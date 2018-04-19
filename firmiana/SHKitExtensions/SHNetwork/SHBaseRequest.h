//
//  SHBaseRequest.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHBaseResponse.h"
#import "SHRequestManager.h"

@interface SHBaseRequest : NSObject


- (void)GET:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion;


- (void)POST:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion;


- (void)PUT:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion;


- (void)DELETE:(NSString *)URLString parameters:(id)parameters completion:(void(^)(SHBaseResponse *response))completion;


@end
