//
//  NSObject+Dealloc.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SHDeallocBlock)(void);

@interface NSObject (Dealloc)

- (void)addDeallocTask:(SHDeallocBlock)deallocTask forTarget:(id)target key:(NSString *)key;

- (void)removeDeallocTaskForTarget:(id)target key:(NSString *)key;

@end
