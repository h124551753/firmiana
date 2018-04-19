//
//  NSString+Contains.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Contains)

@property (nonatomic, assign, readonly, getter=isContainEmoji) BOOL containEmoji;

@property (nonatomic, assign, readonly, getter=isContainChinese) BOOL containChinese;

@property (nonatomic, assign, readonly, getter=isContainBlank) BOOL containBlank;

@end
