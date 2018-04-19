//
//  SHSettingItemButtonCell.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHSettingItemButtonCell.h"

@interface SHSettingItemButtonCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SHSettingItemButtonCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.arrowView setHidden:YES];
        
        self.titleLabel = self.contentView.addLabel(1)
        .masonry(^ (MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.width.mas_lessThanOrEqualTo(self.contentView);
        })
        .view;
    }
    return self;
}

- (void)setItem:(SHSettingItem *)item
{
    item.showDisclosureIndicator = NO;
    [super setItem:item];
    
    [self.titleLabel setText:item.title];
}

@end
