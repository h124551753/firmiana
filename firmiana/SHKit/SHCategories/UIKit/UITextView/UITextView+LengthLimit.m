//
//  UITextView+LengthLimit.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import "UITextView+LengthLimit.h"
#import <objc/runtime.h>

@implementation UITextView (LengthLimit)

static const void *SHTextViewInputLimitMaxLength = &SHTextViewInputLimitMaxLength;

- (NSInteger)maxLength
{
    return [objc_getAssociatedObject(self, SHTextViewInputLimitMaxLength) integerValue];
}

- (void)setMaxLength:(NSInteger)maxLength
{
    objc_setAssociatedObject(self, SHTextViewInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange:) name:@"UITextViewTextDidChangeNotification" object:self];
}

- (void)textViewTextDidChange:(NSNotification *)notification
{
    NSString *toBeString = self.text;

    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.maxLength > 0 && toBeString.length > self.maxLength)) {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.maxLength];
        if (rangeIndex.length == 1) {
            self.text = [toBeString substringToIndex:self.maxLength];
        }
        else {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }
            else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
