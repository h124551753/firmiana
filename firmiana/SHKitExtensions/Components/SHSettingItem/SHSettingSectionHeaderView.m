//
//  SHSettingSectionHeaderView.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHSettingSectionHeaderView.h"

#define     FONT_SETTING_SECTION        [UIFont systemFontOfSize:14.0f]

@interface SHSettingSectionHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SHSettingSectionHeaderView

#pragma mark - # Protocol
+ (CGFloat)viewHeightByDataModel:(NSString *)dataModel
{
    CGFloat textHeight = [dataModel tt_sizeWithFont:FONT_SETTING_SECTION constrainedToWidth:SCREEN_WIDTH - 30].height;
    return textHeight + 20;
}

- (void)setViewDataModel:(id)dataModel
{
    [self.titleLabel setText:dataModel];
}

#pragma mark - # View
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = self.addLabel(1).numberOfLines(0)
        .font([UIFont systemFontOfSize:14]).textColor([UIColor grayColor])
        .masonry(^ (MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.bottom.mas_equalTo(-6);
        })
        .view;
    }
    return self;
}

@end
