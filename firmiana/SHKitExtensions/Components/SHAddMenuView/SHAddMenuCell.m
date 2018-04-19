//
//  SHAddMenuCell.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHAddMenuCell.h"

@interface SHAddMenuCell()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SHAddMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor colorBlackForAddMenu]];
        UIView *selectedView = [[UIView alloc] init];
        [selectedView setBackgroundColor:[UIColor colorBlackForAddMenuHL]];
        [self setSelectedBackgroundView:selectedView];
    
        [self p_initUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.addSeparator(ZZSeparatorPositionBottom).beginAt(15).endAt(-15).color([UIColor colorGrayLine]);
}

- (void)setItem:(SHAddMenuItem *)item
{
    _item = item;
    [self.iconView setImage:[UIImage imageNamed:item.iconPath]];
    [self.titleLabel setText:item.title];
}

#pragma mark - Private Methods
- (void)p_initUI
{
    self.iconView = self.contentView.addImageView(1)
    .masonry(^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(15.0f);
        make.centerY.mas_equalTo(self);
        make.height.and.width.mas_equalTo(32);
    })
    .view;
    
    self.titleLabel = self.contentView.addLabel(2)
    .font([UIFont systemFontOfSize:16.0f])
    .textColor([UIColor whiteColor])
    .masonry(^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(10.0f);
        make.centerY.mas_equalTo(self.iconView);
    })
    .view;
}

@end
