//
//  SHDeallocTask.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Dealloc.h"

@interface SHDeallocTask : NSObject

- (void)addTask:(SHDeallocBlock)task forTarget:(id)target key:(NSString *)key;

- (void)removeTaskForTarget:(id)target key:(NSString *)key;

@end
