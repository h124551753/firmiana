//
//  NSObject+EasyCopy.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EasyCopy)

/**
 *  浅复制目标的所有属性
 *
 *  @param  instance    目标对象
 *
 *  @return BOOL        YES:复制成功,NO:复制失败
 */
- (BOOL)tt_easyShallowCopy:(NSObject *)instance;

/**
 *  深复制目标的所有属性
 *
 *  @param  instance    目标对象
 *
 *  @return BOOL        YES:复制成功,NO:复制失败
 */
- (BOOL)tt_easyDeepCopy:(NSObject *)instance;

@end
