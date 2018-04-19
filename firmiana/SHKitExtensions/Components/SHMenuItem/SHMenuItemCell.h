//
//  SHMenuItemCell.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHMenuItem.h"
#import <TLTabBarController/TLBadge.h>

@interface SHMenuItemCell : UICollectionViewCell <ZZFlexibleLayoutViewProtocol>

/// 左侧icon
@property (nonatomic, strong) UIImageView *iconView;
/// 左侧标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 红点
@property (nonatomic, strong) TLBadge *badgeView;

/// 右侧副标题
@property (nonatomic, strong) UILabel *detailLabel;
/// 右侧广告图
@property (nonatomic, strong) UIImageView *rightImageView;
/// 右侧广告图红点
@property (nonatomic, strong) TLBadge *rightBadgeView;
/// 右箭头
@property (nonatomic, strong) UIImageView *arrowView;


@property (nonatomic, strong) SHMenuItem *menuItem;

@end
