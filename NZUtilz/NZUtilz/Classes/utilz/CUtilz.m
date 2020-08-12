//
//  CUtilz.m
//  Dabdoob
//
//  Created by H. Vakilian on 6/25/1398 AP.
//  Copyright © 1398 nizek. All rights reserved.
//

#import "CUtilz.h"

@implementation CUtilz

+(UIColor*)LColorProgress:(CGFloat)progress srcColor:(UIColor*)srcColor dstColor:(UIColor*)dstColor
{
    CGFloat lowerR, lowerG, lowerB, lowerA;
    [srcColor getRed:&lowerR green:&lowerG blue:&lowerB alpha:&lowerA];
    CGFloat upperR, upperG, upperB, upperA;
    [dstColor getRed:&upperR green:&upperG blue:&upperB alpha:&upperA];
    UIColor* finalColor = [UIColor colorWithRed:lowerR + (upperR - lowerR) * progress green:lowerG + (upperG - lowerG) * progress blue:lowerB + (upperB - lowerB) * progress alpha:lowerA + (upperA - lowerA) * progress];
    return finalColor;
}

+(UIColor*)r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a
{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

@end
