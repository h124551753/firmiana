//
//  UIView+TipView.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface UIView (TipView)

@property (nonatomic, strong, readonly) UIView *tt_tipView;

- (void)showTipView:(UIView *)tipView retryAction:(void (^)(id userData))retryAction;

- (void)showTipView:(UIView *)tipView userData:(id)userData retryAction:(void (^)(id userData))retryAction;

- (void)removeTipView;

@end
