//
//  SHSettingSectionFooterView.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHSettingSectionFooterView.h"

#define     FONT_SETTING_SECTION        [UIFont systemFontOfSize:14.0f]

@interface SHSettingSectionFooterView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SHSettingSectionFooterView

#pragma mark - # Protocol
+ (CGFloat)viewHeightByDataModel:(NSString *)dataModel
{
    CGFloat textHeight = [dataModel tt_sizeWithFont:FONT_SETTING_SECTION constrainedToWidth:SCREEN_WIDTH - 30].height;
    return textHeight + 15;
}

- (void)setViewDataModel:(id)dataModel
{
    [self.titleLabel setText:dataModel];
}

#pragma mark - # View
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = self.addLabel(1)
        .font([UIFont systemFontOfSize:14]).textColor([UIColor grayColor])
        .numberOfLines(0)
        .masonry(^ (MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(8);
        })
        .view;
    }
    return self;
}

@end
