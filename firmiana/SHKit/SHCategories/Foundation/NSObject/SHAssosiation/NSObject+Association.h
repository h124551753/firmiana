//
//  NSObject+Association.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SHAssociation) {
    SHAssociationAssign,
    SHAssociationStrong,
    SHAssociationCopy,
    SHAssociationWeak,
};

@interface NSObject (Association)

/**
 * 根据key添加动态属性，默认noatomic
 */
- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(SHAssociation)association;

/**
 * 根据key添加动态属性
 */
- (void)setAssociatedObject:(id)object forKey:(NSString *)key association:(SHAssociation)association isAtomic:(BOOL)isAtomic;

/**
 * 根据key获取动态属性
 */
- (id)associatedObjectForKey:(NSString *)key;

@end
