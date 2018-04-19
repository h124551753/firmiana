//
//  SHPictureCarouselView.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHPictureCarouselProtocol.h"

#define         DEFAULT_TIMEINTERVAL        3.0f

@class SHPictureCarouselView;
@protocol SHPictureCarouselDelegate <NSObject>

- (void)pictureCarouselView:(SHPictureCarouselView *)pictureCarouselView
              didSelectItem:(id<SHPictureCarouselProtocol>)model;

@end

@interface SHPictureCarouselView : UIView

@property (nonatomic, assign) id<SHPictureCarouselDelegate> delegate;

@property (nonatomic, copy) void (^didSelectItem)(SHPictureCarouselView *pictureCarouselView, id<SHPictureCarouselProtocol> model);

@property (nonatomic, assign) NSTimeInterval timeInterval;

- (void)setData:(NSArray *)data;

@end
