//
//  UINavigationController+Firmiana.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UINavigationController+Firmiana.h"

@implementation UINavigationController (Firmiana)

+ (void)load
{
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont fontNavBarTitle]}];

    SHExchangeMethod(@selector(loadView), @selector(__tt_loadView));
}

- (void)__tt_loadView
{
    [self __tt_loadView];
    
    [self.navigationBar setBarTintColor:[UIColor colorBlackForNavBar]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];
}

@end
