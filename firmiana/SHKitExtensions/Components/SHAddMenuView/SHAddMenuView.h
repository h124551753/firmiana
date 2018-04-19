//
//  SHAddMenuView.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHAddMenuItem.h"

@class SHAddMenuView;
@protocol SHAddMenuViewDelegate <NSObject>

- (void)addMenuView:(SHAddMenuView *)addMenuView didSelectedItem:(SHAddMenuItem *)item;

@end

@interface SHAddMenuView : UIView

@property (nonatomic, assign) id<SHAddMenuViewDelegate>delegate;
@property (nonatomic, copy) void (^itemSelectedAction)(SHAddMenuView *addMenuView, SHAddMenuItem *item);

/**
 *  显示AddMenu
 *
 *  @param view 父View
 */
- (void)showInView:(UIView *)view;

/**
 *  是否正在显示
 */
- (BOOL)isShow;

/**
 *  隐藏
 */
- (void)dismiss;

@end
