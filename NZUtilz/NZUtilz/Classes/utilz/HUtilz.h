//
//  HUtilz.h
//  NZCodebase
//
//  Created by Hamidreza Vakilian on 9/25/1398 AP.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Hash Utilities
@interface HUtilz : NSObject

/// provides a hmac-sha256 hash based on your key and the data you provide
+(NSString*)hmacForKey:(NSString*)key andData:(NSString*)data;

@end

NS_ASSUME_NONNULL_END
