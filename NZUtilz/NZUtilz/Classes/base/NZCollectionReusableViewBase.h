//
//  NZCollectionReusableViewBase.h
//  NZCodebase
//
//  Created by H. Vakilian on 6/7/17.
//  Copyright © 2017 Nizek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZCollectionReusableViewBase : UICollectionReusableView

/// Override this method for view initialization
-(void)initialize;

/// Convenienve high-performance kind generator for the reusable view
+(NSString *)reuseIdentifier;

@end
