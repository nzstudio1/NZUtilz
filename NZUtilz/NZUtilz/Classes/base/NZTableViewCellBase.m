//
//  NZTableViewCellBase.m
//  NZCodebase
//
//  Created by H. Vakilian on 5/1/17.
//  Copyright © 2017 Nizek. All rights reserved.
//

#import "NZTableViewCellBase.h"
#import "NSObject+Meta.h"

@implementation NZTableViewCellBase

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		self.clipsToBounds = YES;
		[self initialize];
	}
	return self;
}

-(void)initialize
{
	self.selectionStyle = UITableViewCellSelectionStyleNone;
}

static NSString* reuseIdentKey = @"reuseIdentifier";
+(NSString *)reuseIdentifier
{
    NSString* reuseIdentifier = [self metaForKey:reuseIdentKey];
    if (!reuseIdentifier)
    {
        reuseIdentifier = NSStringFromClass([self class]);
        [self setMeta:reuseIdentifier forKey:reuseIdentKey];
    }
    return reuseIdentifier;
}

@end
