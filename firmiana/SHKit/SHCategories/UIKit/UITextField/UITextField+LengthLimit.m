//
//  UITextField+LengthLimit.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import "UITextField+LengthLimit.h"
#import <objc/runtime.h>

@implementation UITextField (LengthLimit)

static const void *SHTextFieldInputLimitMaxLength = &SHTextFieldInputLimitMaxLength;

- (NSInteger)maxLength
{
    return [objc_getAssociatedObject(self, SHTextFieldInputLimitMaxLength) integerValue];
}

- (void)setMaxLength:(NSInteger)maxLength
{
    objc_setAssociatedObject(self, SHTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextDidChange
{
    NSString *toBeString = self.text;

    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];

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

@end
