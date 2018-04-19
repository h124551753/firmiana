//
//  SHSettingItemBaseCell.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHSettingItemBaseCell.h"

@implementation SHSettingItemBaseCell

#pragma mark - # Protocol
+ (CGFloat)viewHeightByDataModel:(id)dataModel
{
    return 44.0f;
}

- (void)setViewDataModel:(id)dataModel
{
    [self setItem:dataModel];
}

- (void)viewIndexPath:(NSIndexPath *)indexPath sectionItemCount:(NSInteger)count
{
    if (indexPath.row == 0) {
        self.addSeparator(ZZSeparatorPositionTop);
    }
    else {
        self.removeSeparator(ZZSeparatorPositionTop);
    }
    if (indexPath.row == count - 1) {
        self.addSeparator(ZZSeparatorPositionBottom);
    }
    else {
        self.addSeparator(ZZSeparatorPositionBottom).beginAt(15);
    }
}

#pragma mark - # Cell
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        // 箭头
        self.arrowView = self.addImageView(10)
        .image(SHImage(@"right_arrow"))
        .masonry(^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(8, 13));
            make.right.mas_equalTo(-15);
        })
        .view;
    }
    return self;
}

- (void)setItem:(SHSettingItem *)item
{
    _item = item;
    
    [self setSelectedBackgrounColor:item.disableHighlight ? nil : [UIColor colorGrayLine]];
    [self.arrowView setHidden:!item.showDisclosureIndicator];
}

@end
