//
//  SHMacros.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#ifndef SHMacros_h
#define SHMacros_h


// 网络请求成功回调
typedef void(^SHBlockRequestSuccessWithDatas)(id datas);

@class NSString;
// 网络请求失败回调
typedef void(^SHBlockRequestFailureWithErrorMessage)(NSString *errMsg);

#pragma mark - # 调试相关宏
#define     DEBUG_LOCAL_SERVER      // 使用本地测试服务器
//#define     DEBUG_MEMERY            // 内存测试


#pragma mark - # 服务器地址
// 服务器
#define     HOST_URL                    @"http://101.200.134.35:8000/"

// 表情服务器
#define     IEXPRESSION_HOST_URL        @"http://123.57.155.230/ibiaoqing/admin/"


#define mark - # Default
// 默认头像
#define     DEFAULT_AVATAR_PATH         @"default_head"


#endif /* SHMacros_h */
