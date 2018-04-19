//
//  NSObject+KVOBlock.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SHKVOBlock)(NSDictionary *change, void *context);

@interface NSObject (KVOBlock)

- (void)tt_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context
             withBlock:(SHKVOBlock)block;

-(void)tt_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath;

-(void)tt_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(SHKVOBlock)block;

-(void)tt_removeBlockObserverForKeyPath:(NSString *)keyPath;


@end
