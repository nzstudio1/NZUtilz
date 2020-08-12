//
//  NZCollectionViewCellBase.m
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
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
