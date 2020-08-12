//
//  NZTableViewHeaderFooterBase.h
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZTableViewHeaderFooterBase : UITableViewHeaderFooterView

/// Override this method for view initialization
-(void)initialize;

/// Convenienve high-performance reuse ident generator for the view
+(NSString*)reuseIdentifier;

@end
