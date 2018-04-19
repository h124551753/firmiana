//
//  NSMutableArray+SafeAccess.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableArray (SafeAccess)

- (void)addSafeObject:(id)object;

- (void)addString:(NSString *)stringValue;

- (void)addBool:(BOOL)boolValue;

- (void)addInt:(int)intValue;

- (void)addInteger:(NSInteger)integerValue;

- (void)addUnsignedInteger:(NSUInteger)unsignedIntegerValue;

- (void)addCGFloat:(CGFloat)CGFloatValue;

- (void)addChar:(char)charValue;

- (void)addFloat:(float)floatValue;

- (void)addPoint:(CGPoint)pointValue;

- (void)addSize:(CGSize)sizeValue;

- (void)addRect:(CGRect)rectValue;

@end
