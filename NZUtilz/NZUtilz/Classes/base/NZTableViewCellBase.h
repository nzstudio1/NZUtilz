//
//  NZTableViewCellBase.h
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZTableViewCellBase : UITableViewCell

/// Override this method for cell initialization
-(void)initialize;

/// Convenienve high-performance reuse ident generator for cell
+(NSString*)reuseIdentifier;

@end
