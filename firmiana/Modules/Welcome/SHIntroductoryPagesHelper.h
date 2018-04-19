//
//  SHIntroductoryPagesHelper.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHIntroductoryPagesHelper : NSObject

+ (instancetype)shareInstance;

+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray;

@end
