//
//  SHUIUtility.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Completion) (void);

@interface SHUIUtility : NSObject

#pragma mark - # HUD
+ (void)showLoading:(NSString *)title;
+ (void)hiddenLoading;
+ (void)hiddenLoadingWithDelay:(NSTimeInterval)delay;
+ (void)hiddenLoadingWithCompletion:(Completion)completion;
+ (void)hiddenLoadingWithDelay:(NSTimeInterval)delay completion:(Completion)completion;

+ (void)showSuccessHint:(NSString *)hintText;
+ (void)showErrorHint:(NSString *)hintText;
+ (void)showInfoHint:(NSString *)hintText;

+ (BOOL)isShowLoading;

#pragma mark - # Alert
+ (void)showAlertWithTitle:(NSString *)title;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle actionHandler:(void (^)(NSInteger buttonIndex))actionHandler;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles actionHandler:(void (^)(NSInteger buttonIndex))actionHandler;

@end
