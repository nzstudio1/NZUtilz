//
//  GUtilz.h
//  Dabdoob
//
//  Created by H. Vakilian on 9/16/19.
//  Copyright © 2019 nizek. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Geometry Utilities
 */
@interface GUtilz : NSObject



/// Returns the multiplier that if you apply scaling on the rfit rect, it will be the size that will be fit inside rtarget
/// @param rfit rect to fit
/// @param rtarget target rect
+(CGFloat)scaleToAspectFitRect:(CGRect)rfit inRect:(CGRect)rtarget;


/// Returns the reflection of the input rect inside the target rect
/// @param rfit input rect
/// @param rtarget target rect
+(CGRect)aspectFitRect:(CGRect)rfit inRect:(CGRect) rtarget;

/**
 returns the mid rect by linearly blending the source and dest rects with a progress value.
 
 @param r1 source rect
 @param r2 dest rect
 @param p progress a float value 0..1
 @return the mid rect
 */
+(CGRect)linearRectWithRect:(CGRect)r1 andRect:(CGRect)r2 progress:(float)p;

/**
 Creates and returns a rect with the given size and the given center point.
 
 @param size size of the rect
 @param point center point of the rect
 @return result rect
 */
+(CGRect)rectWithSize:(CGSize)size andCenterPoint:(CGPoint)point;


/**
 Creates and returns a rect which has the same center point with the given rect and also comes with the same width and height provided.
 
 @param size desired size
 @param rect rect to compute the center point
 @return the resulting rect
 */
+(CGRect)rectWithSize:(CGSize)size andCenterPointOfRect:(CGRect)rect;


/**
 Returns the center point of a rect.

 @param rect given rect
 @return center point
 */
+(CGPoint)centerPointOfRect:(CGRect)rect;


/**
 draws a reounded rect inside a drawRect: method. It can also draw outline rounded rects as well. just pass clearColor to the fillcolor.

 @param context the context
 @param rect the reounded rect boundries
 @param radius the corner radius
 @param fillColor the fill color of the rounded rect
 @param lineWidth the stroke width of the shape
 @param strokeColor the stroke color of the shape
 */
+(void)drawRoundedRect:(CGContextRef)context rect:(CGRect)rect radius:(CGFloat)radius fillColor:(UIColor*)fillColor strokeWidth:(CGFloat)lineWidth strokeColor:(UIColor*)strokeColor;



#pragma mark - CGRect Calculations

+(CGRect)CGRectDiff:(CGRect)r dX:(CGFloat)dX dY:(CGFloat)dY dW:(CGFloat)dW dH:(CGFloat)dH;
+(CGRect)CGRectDiffHeight:(CGRect)r dH:(CGFloat)dH;
+(CGRect)CGRectDiffX:(CGRect)r dX:(CGFloat)dX;
+(CGRect)CGRectDiffY:(CGRect)r dY:(CGFloat)dY;
+(CGRect)CGRectDiffWidth:(CGRect)r dW:(CGFloat)dW;
+(CGRect)CGRectSetX:(CGRect)r x:(CGFloat)x;
+(CGRect)CGRectSetXW:(CGRect)r x:(CGFloat)x w:(CGFloat)w;
+(CGRect)CGRectSetY:(CGRect)r y:(CGFloat)y;
+(CGRect)CGRectSetYH:(CGRect)r y:(CGFloat)y h:(CGFloat)h;
+(CGRect)CGRectSetWidth:(CGRect)r w:(CGFloat)w;
+(CGRect)CGRectSetHeight:(CGRect)r h:(CGFloat)h;
+(CGPoint)CGRectGetOrigin:(CGRect)rect;

#pragma mark - Miscellaneous Calculations

+(CGFloat)distanceOfPoint:(CGPoint)p1 fromPoint:(CGPoint)p2;
+(CGFloat)distanceOfPointFromZero:(CGPoint)p;

//returns the device scale
@property (class, readonly) CGFloat scale;

#pragma mark - UIEdgeInsets Calculations

/// Gets an insets parameter and applies deltas for top, left, bottom and right
/// @param insets input insets
/// @param dt delta top
/// @param dL delta left
/// @param dB delta bottom
/// @param dR delta right
+(UIEdgeInsets)UIEdgeInsetsDiff:(UIEdgeInsets)insets dT:(CGFloat)dt dL:(CGFloat)dL dB:(CGFloat)dB dR:(CGFloat)dR;


/// Gets and insets parameter and overrides its top.
/// @param insets input insets
/// @param top overridden top value
+(UIEdgeInsets)UIEdgeInsets:(UIEdgeInsets)insets setTop:(CGFloat)top;

/// Gets and insets parameter and overrides its bottom.
/// @param insets input insets
/// @param bottom overridden bottom value
+(UIEdgeInsets)UIEdgeInsets:(UIEdgeInsets)insets setBottom:(CGFloat)bottom;

+(CGFloat)_1px;

@end

NS_ASSUME_NONNULL_END
