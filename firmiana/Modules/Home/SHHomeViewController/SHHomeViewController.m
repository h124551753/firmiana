//
//  SHHomeViewController.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHHomeViewController.h"

@interface SHHomeViewController ()

@end

@implementation SHHomeViewController

- (id)init
{
    if (self = [super init]) {
        initTabBarItem(self.tabBarItem, LOCSTR(@"微信"), @"tabbar_mainframe", @"tabbar_mainframeHL");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:LOCSTR(@"微信")];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
