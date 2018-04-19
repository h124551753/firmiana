//
//  UIControl+ActionBlocks.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import "UIControl+ActionBlocks.h"
#import <objc/runtime.h>

#define SH_UICONTROL_EVENT(methodName, eventName) \
-(void)methodName : (void (^)(void))eventBlock \
{ \
    objc_setAssociatedObject(self, @selector(methodName:), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC); \
    [self addTarget:self \
             action:@selector(methodName##Action:) \
   forControlEvents:UIControlEvent##eventName]; \
}\
-(void)methodName##Action:(id)sender \
{ \
    void (^block)() = objc_getAssociatedObject(self, @selector(methodName:)); \
    if (block) { \
        block(); \
    } \
}

@implementation UIControl (ActionBlocks)

SH_UICONTROL_EVENT(tt_touchDown, TouchDown)
SH_UICONTROL_EVENT(tt_touchDownRepeat, TouchDownRepeat)
SH_UICONTROL_EVENT(tt_touchDragInside, TouchDragInside)
SH_UICONTROL_EVENT(tt_touchDragOutside, TouchDragOutside)
SH_UICONTROL_EVENT(tt_touchDragEnter, TouchDragEnter)
SH_UICONTROL_EVENT(tt_touchDragExit, TouchDragExit)
SH_UICONTROL_EVENT(tt_touchUpInside, TouchUpInside)
SH_UICONTROL_EVENT(tt_touchUpOutside, TouchUpOutside)
SH_UICONTROL_EVENT(tt_touchCancel, TouchCancel)
SH_UICONTROL_EVENT(tt_valueChanged, ValueChanged)
SH_UICONTROL_EVENT(tt_editingDidBegin, EditingDidBegin)
SH_UICONTROL_EVENT(tt_editingChanged, EditingChanged)
SH_UICONTROL_EVENT(tt_editingDidEnd, EditingDidEnd)
SH_UICONTROL_EVENT(tt_editingDidEndOnExit, EditingDidEndOnExit)

@end
