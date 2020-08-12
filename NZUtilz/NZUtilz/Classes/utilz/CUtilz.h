//
//  CUtilz.h
//  Dabdoob
//
//  Created by H. Vakilian on 6/25/1398 AP.
//  Copyright © 1398 nizek. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Color Utilities
@interface CUtilz : NSObject

+(UIColor*)LColorProgress:(CGFloat)progress srcColor:(UIColor*)srcColor dstColor:(UIColor*)dstColor;
+(UIColor*)r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
@end

NS_ASSUME_NONNULL_END
