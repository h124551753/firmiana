//
//  SHSettingItem.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

#define     CELL_ST_ITEM_NORMAL                 @"SHSettingItemNormalCell"
#define     CELL_ST_ITEM_BUTTON                 @"SHSettingItemButtonCell"
#define     CELL_ST_ITEM_SWITCH                 @"SHSettingItemSwitchCell"
#define     VIEW_ST_HEADER                      @"SHSettingSectionHeaderView"
#define     VIEW_ST_FOOTER                      @"SHSettingSectionFooterView"


#define     SHCreateSettingItem(title)          [SHSettingItem createItemWithTitle:title]

typedef NS_ENUM(NSInteger, SHSettingItemType) {
    SHSettingItemTypeDefalut = 0,
    SHSettingItemTypeTitleButton,
    SHSettingItemTypeSwitch,
    SHSettingItemTypeOther,
};

@interface SHSettingItem : NSObject


/**
 *  主标题
 */
@property (nonatomic, strong) NSString *title;

/**
 *  副标题
 */
@property (nonatomic, strong) NSString *subTitle;

/**
 *  右图片(本地)
 */
@property (nonatomic, strong) NSString *rightImagePath;

/**
 *  右图片(网络)
 */
@property (nonatomic, strong) NSString *rightImageURL;

/**
 *  是否显示箭头（默认YES）
 */
@property (nonatomic, assign) BOOL showDisclosureIndicator;

/**
 *  停用高亮（默认NO）
 */
@property (nonatomic, assign) BOOL disableHighlight;

/**
 *  cell类型，默认default
 */
@property (nonatomic, assign) SHSettingItemType type;

+ (SHSettingItem *)createItemWithTitle:(NSString *)title;

- (NSString *) cellClassName;

@end
