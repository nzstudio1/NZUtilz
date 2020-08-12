//
//  NZTableViewHeaderFooterBase.m
//  NZCodebase
//
//  Created by H. Vakilian on 5/12/17.
//  Copyright © 2017 Nizek. All rights reserved.
//

#import "NZTableViewHeaderFooterBase.h"
#import "NSObject+Meta.h"

@interface NZTableViewHeaderFooterBase ()
{
	BOOL initialized;
}

@end

@implementation NZTableViewHeaderFooterBase

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithReuseIdentifier:reuseIdentifier];
	if (self)
	{
		[self _initialize];
	}
	return self;
}

-(void)_initialize
{
	if (!initialized)
	{
		[self initialize];
		initialized = YES;
	}
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

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundView.backgroundColor = [UIColor clearColor];
}

@end
