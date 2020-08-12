//
//  MUtilz.m
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//


#import "MUtilz.h"

@implementation MUtilz

+(CGFloat)LMapValue:(CGFloat)value srcLow:(CGFloat)low1 srcHigh:(CGFloat)high1 dstLow:(CGFloat)low2 dstHigh:(CGFloat)high2
{
    BOOL negate = low2 > high2;
    if (negate) {
        low2 = -low2;
        high2 = -high2;
    }
    CGFloat result = (low2 + (value - low1) * (high2 - low2) / (high1 - low1));
    
    return (negate ? -1.0 : 1.0) * MIN(MAX(result, low2), high2);
}

+(float)randomFloatBetween:(float)low high:(float)high
{
    uint32_t rnd = arc4random_uniform(UINT32_MAX);
    return [self LMapValue:rnd srcLow:0 srcHigh:UINT32_MAX dstLow:low dstHigh:high];
}

+(NSUInteger)randomIntBetween:(NSUInteger)low high:(NSUInteger)high
{
    return [self randomFloatBetween:low high:high];
}

+(CGFloat)boundX:(CGFloat)x min:(CGFloat)min max:(CGFloat)max {
    return MAX(MIN(x, max), min);
}

+(CGFloat)isBetweenX:(CGFloat)x min:(CGFloat)min max:(CGFloat)max {
    return (x >= min) && (x <= max);
}
@end
