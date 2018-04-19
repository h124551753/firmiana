//
//  SHAppConfig.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAppConfig : NSObject

/// App 版本信息
@property (nonatomic, strong, readonly) NSString *version;

/// 消息页面，+菜单项
@property (nonatomic, strong) NSArray *addMenuItems;

+ (SHAppConfig *)sharedConfig;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
