//
//  NZCollectionViewCellBase.m
//  NZCodebase
//
//  Created by H. Vakilian on 5/6/17.
//  Copyright © 2017 Nizek. All rights reserved.
//

#import "NZCollectionViewCellBase.h"
#import "NSObject+Meta.h"

@implementation NZCollectionViewCellBase

-(instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		[self initialize];
	}
	return self;
}

-(void)initialize
{
	
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
