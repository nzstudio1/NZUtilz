//
//  NZCollectionViewLayoutBase.h
//  NZCodebase
//
//  Created by H. Vakilian on 7/31/16.
//  Copyright © 2016 Nizek. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Convenience subclass for UICollectionViewLayout -- will be documented later.
@interface NZCollectionViewLayoutBase : UICollectionViewLayout

- (NSString *)layoutKeyForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)layoutKeyForHeaderAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)layoutKeyForFooterAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)layoutKeyForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath;

@property (retain, nonatomic, readonly) NSMutableDictionary *layoutAttributes;
@property (retain, nonatomic, readonly) NSMutableArray *elementsInRectArray;
@property (assign, nonatomic) CGSize contentSize;

@end

