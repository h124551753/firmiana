//
//  UITextField+Select.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (Select)

/**
 * 当前选中的字符串范围
 */
- (NSRange)selectedRange;

/**
 *  选中所有文字
 */
- (void)selectedText;

/**
 *  选中指定范围的文字
 */
- (void)setSelectedRange:(NSRange)range;

@end
