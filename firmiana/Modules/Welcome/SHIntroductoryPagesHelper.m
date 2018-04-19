//
//  SHIntroductoryPagesHelper.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHIntroductoryPagesHelper.h"
#import "SHIntroductoryPagesView.h"

@interface SHIntroductoryPagesHelper ()

@property (weak, nonatomic) UIWindow *curWindow;

@property (strong, nonatomic) SHIntroductoryPagesView *curIntroductoryPagesView;

@end

@implementation SHIntroductoryPagesHelper

static SHIntroductoryPagesHelper *shareInstance_ = nil;
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance_ = [[SHIntroductoryPagesHelper alloc] init];
    });
    
    return shareInstance_;
}

+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray
{
    if (![SHIntroductoryPagesHelper shareInstance].curIntroductoryPagesView) {
        [SHIntroductoryPagesHelper shareInstance].curIntroductoryPagesView = [SHIntroductoryPagesView pagesViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) images:imageArray];
    }
    
    [SHIntroductoryPagesHelper shareInstance].curWindow = [UIApplication sharedApplication].keyWindow;
    [[SHIntroductoryPagesHelper shareInstance].curWindow addSubview:[SHIntroductoryPagesHelper shareInstance].curIntroductoryPagesView];
}

@end
