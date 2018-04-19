//
//  UITextView+Placeholder.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface UITextView (Placeholder)

@property (nonatomic, strong, readonly) UITextView *placeholderTextView;

@property (nonatomic, strong) NSString *placeholder;

@end
