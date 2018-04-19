//
//  NSBundle+AppIcon.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "NSBundle+AppIcon.h"

@implementation NSBundle (AppIcon)

- (NSString*)appIconPath
{
    NSString *iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"];
    NSString *iconBasename = [iconFilename stringByDeletingPathExtension];
    NSString *iconExtension = [iconFilename pathExtension];
    return [[NSBundle mainBundle] pathForResource:iconBasename ofType:iconExtension];
}

- (UIImage*)appIcon
{
    UIImage *appIcon = [[UIImage alloc] initWithContentsOfFile:[self appIconPath]];
    return appIcon;
}

@end
