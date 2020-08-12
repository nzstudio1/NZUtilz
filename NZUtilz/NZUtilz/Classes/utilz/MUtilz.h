//
//  MUtilz.h
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 Math Utilities.
 */
@interface MUtilz : NSObject

/**
Linearly maps a value which srcLow <= value <= srcHigh to a RESULT between dstLow and dstHigh.
 UPDATE: dstLow can be higher than dstHigh: Example:
 
 lmap: 0.5, 0, 1, 0, 100 -> 50
 lmap: 0.1, 0, 1, 200, 100 -> 190

@param value the value
@param low1 lower boundry for the source value
@param high1 high bounder for the source value
@param low2 low boundry for the destination value
@param high2 high boundry for the destination value
@return the result value
*/
+(CGFloat)LMapValue:(CGFloat)value srcLow:(CGFloat)low1 srcHigh:(CGFloat)high1 dstLow:(CGFloat)low2 dstHigh:(CGFloat)high2;

/// Generates a random float in the specified boundris
/// @param low lower bound
/// @param high upper bound
+(float)randomFloatBetween:(float)low high:(float)high;


/// Generates a random integer in the specified boundris
/// @param low lower bound
/// @param high upper bound
+(NSUInteger)randomIntBetween:(NSUInteger)low high:(NSUInteger)high;



/// Clamps a value between a range
/// @param x value
/// @param min minimum value
/// @param max maximum value
+(CGFloat)boundX:(CGFloat)x min:(CGFloat)min max:(CGFloat)max;



/// Checks if the variable lies between a minimum and a maximum value
/// @param x value
/// @param min minimum value
/// @param max maximum value
+(CGFloat)isBetweenX:(CGFloat)x min:(CGFloat)min max:(CGFloat)max;


@end

NS_ASSUME_NONNULL_END
