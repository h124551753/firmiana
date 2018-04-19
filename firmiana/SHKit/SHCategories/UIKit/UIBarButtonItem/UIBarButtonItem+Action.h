//
//  UIBarButtonItem+Action.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SHBarButtonActionBlock)(void);

@interface UIBarButtonItem (Action)

+ (id)fixItemSpace:(CGFloat)space;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlick:(SHBarButtonActionBlock)actionBlock;

- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlick:(SHBarButtonActionBlock)actionBlock;

- (void)setActionBlock:(SHBarButtonActionBlock)actionBlock;

@end
