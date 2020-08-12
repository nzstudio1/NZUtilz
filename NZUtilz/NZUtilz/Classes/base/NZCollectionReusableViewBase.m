//
//  NZCollectionReusableViewBase.m
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//

#import "NZCollectionReusableViewBase.h"
#import "NSObject+Meta.h"

@interface NZCollectionReusableViewBase ()
{
	BOOL initialized;
}

@end

@implementation NZCollectionReusableViewBase

-(instancetype)init
{
	self = [super init];
	if (self)
		[self _initialize];
	return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
		[self _initialize];
	return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
		[self _initialize];
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

static NSString* reuseIdentifierKey = @"reuseIdentifier";
+(NSString *)reuseIdentifier
{
    NSString* reuseIdentifier = [self metaForKey:reuseIdentifierKey];
    if (!reuseIdentifier)
    {
        reuseIdentifier = NSStringFromClass([self class]);
        [self setMeta:reuseIdentifier forKey:reuseIdentifierKey];
    }
    return reuseIdentifier;
}


@end
