//
//  Utilz.h
//  Dabdoob
//
//  Created by H. Vakilian on 9/13/19.
//  Copyright © 2019 nizek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NZTopMostControllerProtocol <NSObject>
- (UIViewController * _Nonnull)visibleViewController;
@end

NS_ASSUME_NONNULL_BEGIN


//  General Utilities
@interface Utilz : NSObject

+(NSString*)getClassPropertyTypeString:(void*) property;


+(UIBarButtonItem*)barButtonItemWithConf:(UIView* (^)(void))configCallback;



/// Returns true if the current os version is greater than or equal to the specified version
/// @param version version to compare
+(BOOL)osGreaterThanOrEqualTo:(NSString*)version;

/// Returns true if the current os version is less than or equal to the specified version
/// @param version version to compare
+(BOOL)osLessThanOrEqualTo:(NSString*)version;

/// Returns true if the current os version is greater than or equal to the lower bound and lower than or equal to upper bound
/// @param low lower bound
/// @param high upper bound
+(BOOL)osBetween:(NSString*)low and:(NSString*)high;


/**
 returns true if the app UIView's are set to be right to left or not.
 @return boolean value
 */
+(BOOL)appIsRTL;

/// return true if the language set for the os is rtl (determines from the preffered language which is more trustworthy!)
+(BOOL)osIsRTL;

/// Sets app's UView's direction
/// @param attribute direction
+(void)setAppDirection:(UISemanticContentAttribute)attribute;

/// Sets app's UIView direction according to the rtl/ltr of the preffered language of the os
+(void)setAppDirectionAccordingToDevicePrefferedLanguage;

/// for testing and simulation purposes. don't use it on release mode because it doesn't work :D
+(void)simulateAppDirectionRTL;

/// for testing and simulation purposes. don't use it on release mode because it doesn't work :D
+(void)simulateAppDirectionLTR;

/**
 returns true if the current device orientation is landscape
 @return boolean value
 */
+(BOOL)isLandscape;

/**
returns true if the current device orientation is portrait
@return boolean value
*/
+(BOOL)isPortrait;


/// returns true if the device is iPAD
+(BOOL)isIpad;

// returns true if the device is iPhone
+(BOOL)isIphone;

/// Programatically set the device orientation. If won't force the device orientation only triggers it. The user can still physically change the orientation of device. NOTE: IDK, but it doesn't work on iPad if Requires full screen is not checked on the project settings!
/// @param orientation desired orientation
+(void)setDeviceOrientation:(UIInterfaceOrientation)orientation;
/**
 checks if the object is kind of NSString and not nil

 @param str string object
 @return boolean value indicating if it's a correct object of NSString
 */
+(BOOL)str_ok1:(id _Nullable)str;


/**
 checks if the object is kind NSString and it's length is more than 0

 @param str string object
 @return boolean value
 */
+(BOOL)str_ok2:(id _Nullable)str;

/// if str_ok1 returns false, it returns an empty @"" string. otherwise returns the str object.
/// @param str the string
+(NSString*)str_safe:(id _Nullable)str;


/// checks if the object is of kind NSNumber and not nil
/// @param num value
+(BOOL)num_ok1:(id _Nullable)num;

/// checks if the object is of kind NSNumber and also greater than zero
/// @param num value
+(BOOL)num_ok2:(id _Nullable)num;


/// checks if the object is of kind NSArray and not nil
/// @param arr value
+(BOOL)arr_ok1:(id _Nullable)arr;


/// checks if the object is of kind NSArray and the number of items inside the array is more than zero
/// @param arr value
+(BOOL)arr_ok2:(id _Nullable)arr;


/// checks if the object is of kind NSDictionary and not nil
/// @param dic value
+(BOOL)dic_ok1:(id _Nullable)dic;


/// checks if the object is of kind NSDictionary and number of it's keys are more than zero
/// @param dic value
+(BOOL)dic_ok2:(id _Nullable)dic;

/// checks if the object is of kind NSNumber and it returns true for its bool value
/// @param num value
+(BOOL)bool_true:(id _Nullable)num;

/// checks if the object is of kind NSNumber and it returns false for its bool value otherwise it returns false
/// @param num value
+(BOOL)bool_false:(id _Nullable)num;


/// returns the top most controller from the app. Got the code from PPTopMostController.
+ (UIViewController *)topMostController;

///// Easily get a CGPoint vector for device motion. subscribes on a background thread and delivers on main thread.
///// @param interval interval for retreiving the motion events
//+(RACSignal<NSValue*>*)motion2DVectorInterval:(NSTimeInterval)interval;


@property (assign, nonatomic, readonly, class) CGFloat statusBarHeight;

/// happens on callbar!
@property (assign, nonatomic, readonly, class) CGFloat rootVCPushDownValue;

@property (assign, nonatomic, readonly, class) CGFloat navBarHeight;

@property (assign, nonatomic, readonly, class) CGFloat deviceWidth;

@property (assign, nonatomic, readonly, class) CGFloat deviceHeight;

@property (assign, nonatomic, readonly, class) CGFloat deviceBottomNotch;

@property (assign, nonatomic, readonly, class) BOOL deviceHasBottomNotch;

@property (assign, nonatomic, readonly, class) CGFloat deviceTopNotch;

@property (assign, nonatomic, readonly, class) BOOL deviceHasTopNotch;



@end

NS_ASSUME_NONNULL_END
