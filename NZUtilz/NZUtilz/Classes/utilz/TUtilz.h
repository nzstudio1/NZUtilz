//
//  TUtilz.h
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//  Thread Utilities
@interface TUtilz : NSObject

/// Executes the given block synchronously if already on the main thread. Otherwise executes it asynchronously.
/// @param block block
+(void)main:(dispatch_block_t)block;

/// Executes the given block asynchronously
/// @param block block
+(void)mainAsync:(dispatch_block_t)block;

/// Executes the given block asynchronously after specified seconds.
/// @param block block
/// @param seconds duration
+(void)main:(dispatch_block_t)block after:(float)seconds;

#pragma mark - Background Threads

/// Executes the given block asynchronously on the background-level queue
/// @param block block
+(void)backBackground:(dispatch_block_t)block;

/// Executes the given block asynchronously on the background-level queue after specified seconds.
/// @param block block
/// @param seconds duration
+(void)backBackground:(dispatch_block_t)block after:(float)seconds;


/// Executes the given block asynchronously on the low-level queue
/// @param block block
+(void)backLow:(dispatch_block_t)block;

/// Executes the given block asynchronously on the low-level queue after specified seconds.
/// @param block block
/// @param seconds duration
+(void)backLow:(dispatch_block_t)block after:(float)seconds;


/// Executes the given block asynchronously on the default-level queue
/// @param block block
+(void)back:(dispatch_block_t)block;

/// Executes the given block asynchronously on the default-level queue after specified seconds.
/// @param block block
/// @param seconds duration
+(void)back:(dispatch_block_t)block after:(float)seconds;

/// Executes the given block asynchronously on the high-level queue
/// @param block block
+(void)backHigh:(dispatch_block_t)block;

/// Executes the given block asynchronously on the high-level queue after specified seconds.
/// @param block block
/// @param seconds duration
+(void)backHigh:(dispatch_block_t)block after:(float)seconds;


/// Executes a block synchronously based on the given lock. useful in Swift
/// @param lock object to use for lock
/// @param block the block to execute
+(void)syncWithLock:(id)lock block:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
