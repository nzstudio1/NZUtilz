//
//  NZCollectionReusableViewBase.h
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZCollectionReusableViewBase : UICollectionReusableView

/// Override this method for view initialization
-(void)initialize;

/// Convenienve high-performance kind generator for the reusable view
+(NSString *)reuseIdentifier;

@end
