//
//  SHHomeViewController.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHHomeViewController.h"
#import "HMScannerController.h"
#import "SHBaseRequest.h"
#import "SHRequestManager.h"

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
    
    UIButton *button = UIButton.zz_create(1)
    .backgroundColor([UIColor colorGreenDefault])
    .title(@"二维码").titleFont([UIFont systemFontOfSize:19])
    .cornerRadius(5.0f)
    .view;
    [button addTarget:self action:@selector(toScanner:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(35);
        make.right.mas_equalTo(-35);
        make.height.mas_equalTo(50);
    }];
    
}


- (void)toScanner:(UIButton *)target {
//    HMScannerController *scanner = [HMScannerController scannerWithCardName:nil avatar:nil completion:^(NSString *stringValue) {
//        DDLogInfo(@"scanner result: %@", stringValue);
//    }];
//    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
//    [self showDetailViewController:scanner sender:nil];
    [self testHttpRequest];
}

- (void) testHttpRequest {
    NSString *url = [NSString stringWithFormat:@"%@v1/developer?act=login", HOST_URL];
    NSMutableDictionary *payload = [[NSMutableDictionary alloc] init];
    [payload setValue:@"18127004662" forKey:@"phone"];
    [payload setValue:@"123asd" forKey:@"password"];

    [[SHBaseRequest sharedRequest] PUT:url parameters:payload completion:^(SHBaseResponse *response) {
        DDLogInfo(@"test http result: %@", response);
    }];
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
