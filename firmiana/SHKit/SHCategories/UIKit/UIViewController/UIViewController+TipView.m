//
//  UIViewController+TipView.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import "UIViewController+TipView.h"
#import "UIView+TipView.h"

@implementation UIViewController (TipView)

- (void)showTipView:(UIView *)tipView retryAction:(void (^)(id userData))retryAction
{
    [self showTipView:tipView userData:nil retryAction:retryAction];
}

- (void)showTipView:(UIView *)tipView userData:(id)userData retryAction:(void (^)(id userData))retryAction
{
    [self.view showTipView:tipView userData:userData retryAction:retryAction];
}

- (void)removeTipView
{
    [self.view removeTipView];
}

- (UIView *)tt_tipView
{
    return self.view.tt_tipView;
}

@end
