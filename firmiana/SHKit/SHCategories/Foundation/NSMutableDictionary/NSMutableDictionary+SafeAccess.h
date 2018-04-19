//
//  NSMutableDictionary+SafeAccess.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (SafeAccess)

- (void)setSafeObject:(id)object forKey:(NSString*)key;

- (void)setString:(NSString *)string forKey:(NSString*)key;

- (void)setBool:(BOOL)boolValue forKey:(NSString*)key;

- (void)setInt:(int)intValue forKey:(NSString*)key;

- (void)setInteger:(NSInteger)integerValue forKey:(NSString*)key;

- (void)setUnsignedInteger:(NSUInteger)unsignedIntegerValue forKey:(NSString*)key;

- (void)setCGFloat:(CGFloat)floatValue forKey:(NSString*)key;

- (void)setChar:(char)charValue forKey:(NSString*)key;

- (void)setFloat:(float)floatValue forKey:(NSString*)key;

- (void)setDouble:(double)doubleValue forKey:(NSString*)key;

- (void)setLongLong:(long long)longlongValue forKey:(NSString*)key;

- (void)setPoint:(CGPoint)point forKey:(NSString*)key;

- (void)setSize:(CGSize)size forKey:(NSString*)key;

- (void)setRect:(CGRect)rect forKey:(NSString*)key;

@end