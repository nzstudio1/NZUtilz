//
//  GUtilz.m
//  Dabdoob
//
//  Created by H. Vakilian on 9/16/19.
//  Copyright © 2019 nizek. All rights reserved.
//

#import "GUtilz.h"
#import "MUtilz.h"

@implementation GUtilz

+(CGFloat)scaleToAspectFitRect:(CGRect)rfit inRect:(CGRect)rtarget
{
    CGFloat s = CGRectGetWidth(rtarget) / CGRectGetWidth(rfit);
    if (CGRectGetHeight(rfit) * s <= CGRectGetHeight(rtarget)) {
        return s;
    }
    return CGRectGetHeight(rtarget) / CGRectGetHeight(rfit);
}

+(CGRect)aspectFitRect:(CGRect)rfit inRect:(CGRect) rtarget
{
    CGFloat s = [GUtilz scaleToAspectFitRect:rfit inRect:rtarget];
    CGFloat w = CGRectGetWidth(rfit) * s;
    CGFloat h = CGRectGetHeight(rfit) * s;
    CGFloat x = CGRectGetMidX(rtarget) - w / 2;
    CGFloat y = CGRectGetMidY(rtarget) - h / 2;
    return CGRectMake(x, y, w, h);
}

+(CGRect)linearRectWithRect:(CGRect)r1 andRect:(CGRect)r2 progress:(float)p
{
    CGRect rect;
    rect.origin.x = [MUtilz LMapValue:p srcLow:0 srcHigh:1 dstLow:CGRectGetMinX(r1) dstHigh:CGRectGetMinX(r2)];
    rect.origin.y = [MUtilz LMapValue:p srcLow:0 srcHigh:1 dstLow:CGRectGetMinY(r1) dstHigh:CGRectGetMinY(r2)];
    rect.size.width = [MUtilz LMapValue:p srcLow:0 srcHigh:1 dstLow:CGRectGetWidth(r1) dstHigh:CGRectGetWidth(r2)];
    rect.size.height = [MUtilz LMapValue:p srcLow:0 srcHigh:1 dstLow:CGRectGetHeight(r1) dstHigh:CGRectGetHeight(r2)];
    return rect;
}

+(CGRect)rectWithSize:(CGSize)size andCenterPoint:(CGPoint)point
{
    CGRect rect;
    rect.origin.x = point.x - (size.width / 2);
    rect.origin.y = point.y - (size.height / 2);
    rect.size = size;
    return rect;
}

+(CGRect)rectWithSize:(CGSize)size andCenterPointOfRect:(CGRect)rect
{
    return [self rectWithSize:size andCenterPoint:[self centerPointOfRect:rect]];
}

+(CGPoint)centerPointOfRect:(CGRect)rect
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

+(void)drawRoundedRect:(CGContextRef)context rect:(CGRect)rect radius:(CGFloat)radius fillColor:(UIColor*)fillColor strokeWidth:(CGFloat)lineWidth strokeColor:(UIColor*)strokeColor
{
    CGContextSaveGState(context);
    
    CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetLineWidth(context, lineWidth);

    CGFloat minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect);
    CGFloat miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect);
    
    CGContextMoveToPoint(context, minx, midy);
    
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextRestoreGState(context);
}


#pragma mark - CGRect Calculations

+(CGRect)CGRectDiff:(CGRect)r dX:(CGFloat)dX dY:(CGFloat)dY dW:(CGFloat)dW dH:(CGFloat)dH
{
    return CGRectMake(CGRectGetMinX(r) + dX,
                      CGRectGetMinY(r) + dY,
                      CGRectGetWidth(r) + dW,
                      CGRectGetHeight(r) + dH);
}

+(CGRect)CGRectDiffHeight:(CGRect)r dH:(CGFloat)dH
{
    return CGRectMake(CGRectGetMinX(r), CGRectGetMinY(r), CGRectGetWidth(r), CGRectGetHeight(r) + dH);
}

+(CGRect)CGRectDiffX:(CGRect)r dX:(CGFloat)dX
{
    return CGRectMake(CGRectGetMinX(r) + dX, CGRectGetMinY(r), CGRectGetWidth(r), CGRectGetHeight(r));
}

+(CGRect)CGRectDiffY:(CGRect)r dY:(CGFloat)dY
{
    return CGRectMake(CGRectGetMinX(r), CGRectGetMinY(r) + dY, CGRectGetWidth(r), CGRectGetHeight(r));
}

+(CGRect)CGRectDiffWidth:(CGRect)r dW:(CGFloat)dW
{
    return CGRectMake(CGRectGetMinX(r), CGRectGetMinY(r), CGRectGetWidth(r) + dW, CGRectGetHeight(r));
}

/*
 Setting Method
 */

+(CGRect)CGRectSetX:(CGRect)r x:(CGFloat)x
{
    return CGRectMake(x, CGRectGetMinY(r), CGRectGetWidth(r), CGRectGetHeight(r));
}

+(CGRect)CGRectSetXW:(CGRect)r x:(CGFloat)x w:(CGFloat)w
{
    return CGRectMake(x, CGRectGetMinY(r), w, CGRectGetHeight(r));
}

+(CGRect)CGRectSetY:(CGRect)r y:(CGFloat)y
{
    return CGRectMake(CGRectGetMinX(r), y, CGRectGetWidth(r), CGRectGetHeight(r));
}

+(CGRect)CGRectSetYH:(CGRect)r y:(CGFloat)y h:(CGFloat)h
{
    return CGRectMake(CGRectGetMinX(r), y, CGRectGetWidth(r), h);
}

+(CGRect)CGRectSetWidth:(CGRect)r w:(CGFloat)w
{
    return CGRectMake(CGRectGetMinX(r), CGRectGetMinY(r), w, CGRectGetHeight(r));
}

+(CGRect)CGRectSetHeight:(CGRect)r h:(CGFloat)h
{
    return CGRectMake(CGRectGetMinX(r), CGRectGetMinY(r), CGRectGetWidth(r), h);
}

+(CGPoint)CGRectGetOrigin:(CGRect)rect
{
    return rect.origin;
}

#pragma mark - Miscellaneous Calculations

+(CGFloat)distanceOfPoint:(CGPoint)p1 fromPoint:(CGPoint)p2
{
    return sqrt(pow(p2.x-p1.x, 2) + pow(p2.y-p1.y, 2));
}

+(CGFloat)distanceOfPointFromZero:(CGPoint)p
{
    return [self distanceOfPoint:p fromPoint:CGPointZero];
}

+(CGFloat)scale
{
    return UIScreen.mainScreen.scale;
}

#pragma mark - UIEdgeInsets Calculations

+(UIEdgeInsets)UIEdgeInsetsDiff:(UIEdgeInsets)insets dT:(CGFloat)dt dL:(CGFloat)dl dB:(CGFloat)db dR:(CGFloat)dr
{
    return UIEdgeInsetsMake(insets.top + dt, insets.left + dl, insets.bottom + db, insets.right + dr);
}

+(UIEdgeInsets)UIEdgeInsets:(UIEdgeInsets)insets setTop:(CGFloat)top
{
    return UIEdgeInsetsMake(top, insets.left, insets.bottom, insets.right);
}

+(UIEdgeInsets)UIEdgeInsets:(UIEdgeInsets)insets setBottom:(CGFloat)bottom
{
    return UIEdgeInsetsMake(insets.top, insets.left, bottom, insets.right);
}

+(CGFloat)_1px
{
    return 1.0f/[[UIScreen mainScreen] scale];
}

@end
