//
//  TUtilz.m
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//

#import "TUtilz.h"

@implementation TUtilz


+(void)main:(dispatch_block_t)block
{
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

+(void)mainAsync:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_main_queue(), block);
}

+(void)main:(dispatch_block_t)block after:(float)seconds
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

#pragma mark - Background Threads

+(void)backBackground:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block);
}

+(void)backBackground:(dispatch_block_t)block after:(float)seconds
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block);
}

+(void)backLow:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), block);
}

+(void)backLow:(dispatch_block_t)block after:(float)seconds
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), block);
}

+(void)back:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

+(void)back:(dispatch_block_t)block after:(float)seconds
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}


+(void)backHigh:(dispatch_block_t)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), block);
}

+(void)backHigh:(dispatch_block_t)block after:(float)seconds

{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), block);
}


+(void)syncWithLock:(id)lock block:(dispatch_block_t)block
{
    @synchronized (lock) {
        block();
    }
}

@end
