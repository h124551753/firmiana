//
//  SHLaunchManager.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHLaunchManager.h"
#import "SHUserHelper.h"
#import "AdvertiseHelper.h"
#import "SHIntroductoryPagesHelper.h"
#import "YYFPSLabel.h"
#import "SHLoginViewController.h"
#import "SHHomeViewController.h"
#import "SHDiscoverViewController.h"
#import "SHMessageViewController.h"
#import "SHMineViewController.h"

@interface SHLaunchManager ()

@property (nonatomic, weak) UIWindow *window;

@end

@implementation SHLaunchManager

@synthesize tabBarController = _tabBarController;


+ (SHLaunchManager *)sharedInstance
{
    static SHLaunchManager *rootVCManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rootVCManager = [[self alloc] init];
    });
    return rootVCManager;
}

- (void)launchInWindow:(UIWindow *)window
{
    self.window = window;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    if ([SHUserHelper sharedHelper].isLogin || true) {      // 已登录
        [self.tabBarController setViewControllers:[self p_createTabBarChildViewController]];
        [self setCurRootVC:self.tabBarController];
        
        // 初始化用户信息
//        [self initUserData];
    }
    else {  // 未登录
        SHLoginViewController *accountVC = [[SHLoginViewController alloc] init];
        @weakify(self);
        [accountVC setLoginSuccess:^{
            @strongify(self);
            [self launchInWindow:window];
        }];
        [self setCurRootVC:accountVC];
    }
    
    // 欢迎视图
    [SHIntroductoryPagesHelper showIntroductoryPageView:@[@"intro_0.jpg", @"intro_1.jpg", @"intro_2.jpg", @"intro_3.jpg"]];
    
    NSArray <NSString *> *imagesURLS = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189872684&di=03f9df0b71bb536223236235515cf227&imgtype=0&src=http%3A%2F%2Fatt1.dzwww.com%2Fforum%2F201405%2F29%2F1033545qqmieznviecgdmm.gif", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189851096&di=224fad7f17468c2cc080221dd78a4abf&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F12%2F20150512124019_GPjEJ.gif"];
    // 启动广告
    [AdvertiseHelper showAdvertiserView:imagesURLS];
    
    // 刷新率
    [self.window addSubview:[[YYFPSLabel alloc] initWithFrame:CGRectMake(20, 70, 0, 0)]];
}

- (void)setCurRootVC:(__kindof UIViewController *)curRootVC
{
    _curRootVC = curRootVC;
    
    {
        UIWindow *window = self.window ? self.window : [UIApplication sharedApplication].keyWindow;
        [window removeAllSubviews];
        [window setRootViewController:curRootVC];
        [window addSubview:curRootVC.view];
        [window makeKeyAndVisible];
    }
}

#pragma mark - # Private Methods
- (NSArray *)p_createTabBarChildViewController
{
    SHHomeViewController *homeVC = [[SHHomeViewController alloc] init];
    SHDiscoverViewController *discoverVC = [[SHDiscoverViewController alloc] init];
    SHMessageViewController *messageVC = [[SHMessageViewController alloc] init];
    SHMineViewController *mineVC = [[SHMineViewController alloc] init];

    NSArray *data = @[addNavigationController(homeVC),
                      addNavigationController(discoverVC),
                      addNavigationController(messageVC),
                      addNavigationController(mineVC),
                      ];
    return data;
}


#pragma mark - # Getters
- (TLTabBarController *)tabBarController
{
    if (!_tabBarController) {
        TLTabBarController *tabbarController = [[TLTabBarController alloc] init];
        [tabbarController.tabBar setBackgroundColor:[UIColor colorGrayBG]];
        [tabbarController.tabBar setTintColor:[UIColor colorGreenDefault]];
        _tabBarController = tabbarController;
    }
    return _tabBarController;
}



@end
