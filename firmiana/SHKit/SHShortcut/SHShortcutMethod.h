//
//  SHShortcutMethod.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

UILabel *createLabel(UIFont *textFont, UIColor *textColor);

UIButton *createButton(UIFont *titleFont, UIColor *titleColor, id target, SEL touchUpInsideAction);

/**
 * 为ViewController添加navController
 */
UINavigationController *addNavigationController(UIViewController *viewController);

/**
 * 初始化tabBarItem
 */
void initTabBarItem(UITabBarItem *tabBarItem, NSString *tilte, NSString *image, NSString *imageHL);
