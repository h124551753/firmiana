//
//  SHShortcutMethod.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHShortcutMethod.h"

UILabel *createLabel(UIFont *textFont, UIColor *textColor)
{
    UILabel *label = [[UILabel alloc] init];
    [label setFont:textFont];
    [label setTextColor:textColor];
    return label;
}

UIButton *createButton(UIFont *titleFont, UIColor *titleColor, id target, SEL touchUpInsideAction)
{
    UIButton *button = [[UIButton alloc] init];
    !titleFont ? : [button.titleLabel setFont:titleFont];
    !titleFont ? : [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (target && touchUpInsideAction) {
        [button addTarget:target action:touchUpInsideAction forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

UINavigationController *addNavigationController(UIViewController *viewController) {
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:viewController];
    return navC;
}


void initTabBarItem(UITabBarItem *tabBarItem, NSString *tilte, NSString *image, NSString *imageHL) {
    [tabBarItem setTitle:tilte];
    [tabBarItem setImage:[UIImage imageNamed:image]];
    [tabBarItem setSelectedImage:[UIImage imageNamed:imageHL]];
}
