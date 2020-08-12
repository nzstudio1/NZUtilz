//
//  NSObject+Meta.m
//  NSObject+Meta
//
//  Created by H. Vakilian on 9/9/2020 AP.
//  Copyright (c) 2020 NZStudio. All rights reserved.
//

#import "NSObject+Meta.h"
#import <objc/runtime.h>

static char const * const MetaKey = "MyMetaKey";
static char const * const WeakMetaKey = "MyWeakMetaKey";

#define default_obj_key @"__defaultMetaKey"

@implementation NSObject (NSObjectAdditions)

-(id)meta {
    return [self metaForKey:default_obj_key];
}

-(void)setMeta:(id)obj {
    [self setMeta:obj forKey:default_obj_key];
}

-(void)setMeta:(id)obj forKey:(NSString*)key
{
    @synchronized (self) {
        NSMutableDictionary* possibleDic = objc_getAssociatedObject(self, MetaKey);
        if (possibleDic)
            possibleDic[key] = obj;
        else
        {
            possibleDic = [NSMutableDictionary new];
            possibleDic[key] = obj;
            objc_setAssociatedObject(self, MetaKey, possibleDic, OBJC_ASSOCIATION_RETAIN);
        }
    }
}

- (id)metaForKey:(NSString *)key
{
    @synchronized (self) {
        NSMutableDictionary* possibleDic = objc_getAssociatedObject(self, MetaKey);
        
        return possibleDic ? possibleDic[key] : nil;
    }
}

/******************** WEAK META ********************/

-(void)setWeakMeta:(id)obj forKey:(NSString *)key
{
    @synchronized (self) {
        NSMapTable* possibleMap = objc_getAssociatedObject(self, WeakMetaKey);
        if (!possibleMap) {
            possibleMap = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableWeakMemory];
            objc_setAssociatedObject(self, WeakMetaKey, possibleMap, OBJC_ASSOCIATION_RETAIN);
        }
        
        if (obj) {
            [possibleMap setObject:obj forKey:key]; // setObject:nil, forKey:... doesn't remove the key from the map! Fixed by Hamid 17/5/2020
        } else {
            [possibleMap removeObjectForKey:key];
        }
    }
}

-(id)weakMetaForKey:(NSString *)key
{
    @synchronized (self) {
        NSMapTable* possibleMap = objc_getAssociatedObject(self, WeakMetaKey);
        return possibleMap ? [possibleMap objectForKey:key] : nil;
    }
}

-(id)weakMeta
{
    return [self weakMetaForKey:default_obj_key];
}

-(void)setWeakMeta:(id)weakMeta
{
    [self setWeakMeta:weakMeta forKey:default_obj_key];
}


@end

