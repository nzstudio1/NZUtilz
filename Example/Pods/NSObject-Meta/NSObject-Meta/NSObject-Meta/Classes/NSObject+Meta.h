//
//  NSObject+Meta.h
//  NSObject+Meta
//
//  Created by H. Vakilian on 9/9/2020 AP.
//  Copyright (c) 2020 NZStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// A convenient way to assign object(s) to another instance of NSObject. Supports both strong and weak references. For retained objects it uses a NSMutableDictionary and for the weak objects it uses NSMapTable with weak value containers.
@interface NSObject (Meta)

/// Strong meta object.
@property (nonatomic, nullable) id meta;

/// If you want to set multiple retained meta objects for an object use this method.
/// @param obj sepecified object
/// @param key an specific key
-(void)setMeta:(nullable id)obj forKey:(NSString*)key;

/// To get the retained object by a sepcific key.
/// @param key an specific key
-(nullable id)metaForKey:(NSString*)key;

/******************** WEAK META ********************/

/// Weak meta object
@property (nonatomic, nullable) id weakMeta;

/// If you want to set multiple weak meta objects for an object use this method.
/// @param obj sepecified object
/// @param key an specific key
-(void)setWeakMeta:(nullable id)obj forKey:(NSString*)key;


/// To get the weak object by a sepcific key.
/// @param key an specific key
-(nullable id)weakMetaForKey:(NSString*)key;

NS_ASSUME_NONNULL_END

@end
