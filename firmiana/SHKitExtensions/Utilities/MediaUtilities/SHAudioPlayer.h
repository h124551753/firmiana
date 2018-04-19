//
//  SHAudioPlayer.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAudioPlayer : NSObject

@property (nonatomic, assign, readonly) BOOL isPlaying;

+ (SHAudioPlayer *)sharedAudioPlayer;

- (void)playAudioAtPath:(NSString *)path complete:(void (^)(BOOL finished))complete;

- (void)stopPlayingAudio;

@end
