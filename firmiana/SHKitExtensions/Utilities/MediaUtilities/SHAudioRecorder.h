//
//  SHAudioRecorder.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAudioRecorder : NSObject

+ (SHAudioRecorder *)sharedRecorder;

- (void)startRecordingWithVolumeChangedBlock:(void (^)(CGFloat volume))volumeChanged
                               completeBlock:(void (^)(NSString *path, CGFloat time))complete
                                 cancelBlock:(void (^)())cancel;
- (void)stopRecording;
- (void)cancelRecording;

@end
