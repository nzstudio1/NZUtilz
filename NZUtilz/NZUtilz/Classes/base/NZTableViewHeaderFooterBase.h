//
//  NZTableViewHeaderFooterBase.h
//  NZCodebase
//
//  Created by H. Vakilian on 5/12/17.
//  Copyright © 2017 Nizek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZTableViewHeaderFooterBase : UITableViewHeaderFooterView

/// Override this method for view initialization
-(void)initialize;

/// Convenienve high-performance reuse ident generator for the view
+(NSString*)reuseIdentifier;

@end
