//
//  SHViewController.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+PopGesture.h"

@interface SHViewController : UIViewController

@property (nonatomic, strong) NSString *analyzeTitle;

/// 当前VC stutusBar的状态，仅在viewWillAppear时生效，默认LightContent
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@end
