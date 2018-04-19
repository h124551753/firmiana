//
//  SHActionSheet.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SHActionSheet;
@protocol SHActionSheetDelegate <NSObject>

@optional;
- (void)actionSheet:(SHActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface SHActionSheet : UIView


/// 按钮个数
@property (nonatomic, assign, readonly) NSInteger numberOfButtons;

/// 取消按钮index
@property (nonatomic, assign, readonly) NSInteger cancelButtonIndex;

/// 高亮按钮index
@property (nonatomic, assign, readonly) NSInteger destructiveButtonIndex;

@property (nonatomic, weak) id<SHActionSheetDelegate> delegate;

/// 点击事件响应block
@property (nonatomic, copy) void (^clickAction)(NSInteger buttonIndex);

- (id)initWithTitle:(NSString *)title
           delegate:(id<SHActionSheetDelegate>)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;


- (id)initWithTitle:(NSString *)title
        clickAction:(void (^)(NSInteger buttonIndex))clickAction
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

/**
 *  显示ActionSheet
 */
- (void)show;

/**
 *  根据index获取按钮标题
 *
 *  @param  buttonIndex     按钮index
 */
- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex;

@end
