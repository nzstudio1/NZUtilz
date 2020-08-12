//
//  NZCollectionViewLayoutBase.m
//  NZCodebase
//
//  Created by H. Vakilian on 7/31/16.
//  Copyright © 2016 Nizek. All rights reserved.
//

#import "NZCollectionViewLayoutBase.h"

@interface NZCollectionViewLayoutBase ()

@property (retain, nonatomic, readwrite) NSMutableDictionary *layoutAttributes;
@property (retain, nonatomic, readwrite) NSMutableArray *elementsInRectArray;

@end

@implementation NZCollectionViewLayoutBase

-(NSString *)layoutKeyForIndexPath:(NSIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"i_%ld_%ld", indexPath.section, indexPath.row];
}

-(NSString *)layoutKeyForHeaderAtIndexPath:(NSIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"h_%ld_%ld", indexPath.section, indexPath.row];
}
-(NSString *)layoutKeyForFooterAtIndexPath:(NSIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"f_%ld_%ld", indexPath.section, indexPath.row];
}

-(NSString *)layoutKeyForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"d_%ld_%ld_%@", indexPath.section, indexPath.row, elementKind];
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [self layoutKeyForDecorationViewOfKind:elementKind atIndexPath:indexPath];
    return self.layoutAttributes[key];
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    NSString *headerOrFooterKey;
    if (elementKind == UICollectionElementKindSectionHeader)
        headerOrFooterKey = [self layoutKeyForHeaderAtIndexPath:indexPath];
    else //footer
        headerOrFooterKey = [self layoutKeyForFooterAtIndexPath:indexPath];
    
    return self.layoutAttributes[headerOrFooterKey];
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [self layoutKeyForIndexPath:indexPath];
    return self.layoutAttributes[key];
}

-(CGSize)collectionViewContentSize
{
    return self.contentSize;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {
        UICollectionViewLayoutAttributes *layoutAttribute = self.layoutAttributes[evaluatedObject];
        return CGRectIntersectsRect(rect, [layoutAttribute frame]);
    }];
    
    NSArray *matchingKeys = [[self.layoutAttributes allKeys] filteredArrayUsingPredicate:predicate];
    return [self.layoutAttributes objectsForKeys:matchingKeys notFoundMarker:[NSNull null]];
}

// just prevent from creating a NSMutableDictionary every time prepareLayout executes
-(NSMutableDictionary *)layoutAttributes
{
    if (!_layoutAttributes)
        _layoutAttributes = [NSMutableDictionary new];
    return _layoutAttributes;
}

-(NSMutableArray*)elementsInRectArray
{
    if (!_elementsInRectArray)
        _elementsInRectArray = [NSMutableArray new];
    return _elementsInRectArray;
}

@end

