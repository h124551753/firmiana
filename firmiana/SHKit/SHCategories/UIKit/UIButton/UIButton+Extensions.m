//
//  UIButton+Extensions.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "UIButton+Extensions.h"
#import "UIImage+Color.h"

@implementation UIButton (Extensions)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:state];
}

- (void)setImage:(UIImage *)image imageHL:(UIImage *)imageHL
{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:imageHL forState:UIControlStateHighlighted];
}

- (CGSize)setButtonImagePosition:(SHButtonImagePosition)position spacing:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    
    CGSize buttonSize = CGSizeZero;
    if (position == SHButtonImagePositionLeft || position == SHButtonImagePositionRight) {
        if (position == SHButtonImagePositionLeft) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
        }
        else {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + spacing/2, 0, -(titleSize.width + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.height + spacing/2), 0, imageSize.height + spacing/2);
        }
        buttonSize.width = imageSize.width + titleSize.width + spacing;
        buttonSize.height = MAX(imageSize.height, titleSize.height);
    }
    else {
        CGFloat imageOffsetX = titleSize.width > imageSize.width ? (titleSize.width - imageSize.width) / 2.0 : 0;
        CGFloat imageOffsetY = imageSize.height / 2;
        
        
        CGFloat titleOffsetXR = titleSize.width > imageSize.width ? 0 : (imageSize.width - titleSize.width) / 2.0;
        CGFloat titleOffsetX = imageSize.width + titleOffsetXR;
        CGFloat titleOffsetY = titleSize.height / 2;
        
        if (position == SHButtonImagePositionTop) {
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(titleOffsetY, -titleOffsetX, -titleOffsetY, -titleOffsetXR);
        }
        else {
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-titleOffsetY, -titleOffsetX, titleOffsetY, -titleOffsetXR);
        }
        buttonSize.width = MAX(imageSize.width, titleSize.width);
        buttonSize.height = imageSize.height + titleSize.height + spacing;
    }

    return buttonSize;
}

@end
