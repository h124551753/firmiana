//
//  SHSettingItemSwitchCell.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHSettingItemSwitchCell.h"

@interface SHSettingItemSwitchCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UISwitch *switchControl;

@end

@implementation SHSettingItemSwitchCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_initSettingItemSwitchCellSubviews];
    }
    return self;
}

- (void)setItem:(SHSettingItem *)item
{
    item.showDisclosureIndicator = NO;
    item.disableHighlight = YES;
    [super setItem:item];
    
    [self.titleLabel setText:item.title];
}

#pragma mark - # UI
- (void)p_initSettingItemSwitchCellSubviews
{
    self.titleLabel = self.contentView.addLabel(1)
    .masonry(^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.right.mas_lessThanOrEqualTo(-80);
    })
    .view;
    
    self.switchControl = self.contentView.addSwitch(2)
    .masonry(^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_lessThanOrEqualTo(-15);
    })
    .view;

}
@end
