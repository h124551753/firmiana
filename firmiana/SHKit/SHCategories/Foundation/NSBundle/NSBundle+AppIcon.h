//
//  NSBundle+AppIcon.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (AppIcon)

@property (nonatomic, strong, readonly) NSString *appIconPath;

@property (nonatomic, strong, readonly) UIImage *appIcon;

@end
