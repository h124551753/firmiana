//
//  SHAddMenuItem.h
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SHAddMneuType) {
    SHAddMneuTypeGroupChat = 0,
    SHAddMneuTypeAddFriend,
    SHAddMneuTypeScan,
    SHAddMneuTypeWallet,
};

@interface SHAddMenuItem : NSObject

@property (nonatomic, assign) SHAddMneuType type;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, strong) NSString *className;

+ (SHAddMenuItem *)createWithType:(SHAddMneuType)type title:(NSString *)title iconPath:(NSString *)iconPath className:(NSString *)className;

@end
