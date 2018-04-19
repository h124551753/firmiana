//
//  SHRequestManager.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHBaseResponse.h"

typedef NSString SHDataName;

typedef enum : NSInteger {
    // 自定义错误码
    SHRequestManagerStatusCodeCustomDemo = -10000,
} SHRequestManagerStatusCode;

typedef SHBaseResponse *(^ResponseFormat) (SHBaseResponse *response);

@interface SHRequestManager : AFHTTPSessionManager


+ (instancetype)sharedManager;

//本地数据模式
@property (assign, nonatomic) BOOL isLocal;

//预处理返回的数据
@property (copy, nonatomic) ResponseFormat responseFormat;

// https 验证
@property (nonatomic, copy) NSString *cerFilePath;

- (void)POST:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *response))completion;

- (void)PUT:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *response))completion;

- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *response))completion;

- (void)DELETE:(NSString *)urlString parameters:(id)parameters completion:(void (^)(SHBaseResponse *response))completion;


/*
 上传
 data 数据对应的二进制数据
 SHDataName data对应的参数
 */
- (void)upload:(NSString *)urlString parameters:(id)parameters formDataBlock:(NSDictionary<NSData *, SHDataName *> *(^)(id<AFMultipartFormData> formData, NSMutableDictionary<NSData *, SHDataName *> *needFillDataDict))formDataBlock progress:(void (^)(NSProgress *progress))progress completion:(void (^)(SHBaseResponse *response))completion;


@end
