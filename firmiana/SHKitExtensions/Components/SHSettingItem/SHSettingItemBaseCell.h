//
//  SHSettingItemBaseCell.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHSettingItem.h"

@interface SHSettingItemBaseCell : UICollectionViewCell <ZZFlexibleLayoutViewProtocol>

/// 右箭头
@property (nonatomic, strong) UIImageView *arrowView;

@property (nonatomic, strong) SHSettingItem *item;

@end
