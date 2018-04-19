//
//  NSURL+Params.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Params)

/**
 *  url参数转字典
 */
- (NSDictionary *)parameters;

/**
 *  根据参数名 取参数值
 */
- (NSString *)valueForParameter:(NSString *)parameterKey;

@end
