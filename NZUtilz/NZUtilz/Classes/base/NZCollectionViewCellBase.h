//
//  NZCollectionViewCellBase.h
//  NZCodebase
//
//  Created by H. Vakilian on 5/6/17.
//  Copyright © 2017 Nizek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZCollectionViewCellBase : UICollectionViewCell

/// Override this method for cell initialization
-(void)initialize;

/// Convenienve high-performance reuse ident generator for cell
+(NSString*)reuseIdentifier;

@end
