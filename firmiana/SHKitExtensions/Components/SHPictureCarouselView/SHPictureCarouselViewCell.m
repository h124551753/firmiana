//
//  SHPictureCarouselViewCell.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHPictureCarouselViewCell.h"

@interface SHPictureCarouselViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SHPictureCarouselViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        
        [self p_addMasonry];
    }
    return self;
}

- (void)setModel:(id<SHPictureCarouselProtocol>)model
{
    [self.imageView tt_setImageWithURL:SHURL([model pictureURL])];
}

#pragma mark - # Private Methods
- (void)p_addMasonry
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

#pragma mark - # Getter
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
