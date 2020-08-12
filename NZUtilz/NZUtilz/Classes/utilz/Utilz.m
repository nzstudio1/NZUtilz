//
//  Utilz.m
//  Dabdoob
//
//  Created by H. Vakilian on 9/13/19.
//  Copyright © 2019 nizek. All rights reserved.
//

#import "Utilz.h"
#import "objc/runtime.h"
#import <CoreMotion/CoreMotion.h>

@interface UIBarButtonItemCustomViewHolder: UIView
@property (retain, nonatomic, readonly) UIView* customView;
@end

@implementation UIBarButtonItemCustomViewHolder

- (instancetype)initWithCustomView:(UIView*)customView
{
    self = [super initWithFrame:CGRectMake(0, 0, 44.0, 44.0)];
    if (self) {
        _customView = customView;
        customView.frame = self.bounds;
        [self addSubview:customView];
//        [customView nzAlignAllEdgesWithSuperview];
        [customView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = true;
        [customView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = true;
        [customView.topAnchor constraintEqualToAnchor:self.topAnchor].active = true;
        [customView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
    }
    return self;
}

/* Reported by Marcello. We were getting autolayout warning on iOS 13.4+. removed this override and it's now working fine. also tested on ios 12. */
//- (void)didMoveToSuperview {
//    if (self.superview) {
//        [self nzAlignAllEdgesWithSuperview];
//    }
//}

@end

@implementation Utilz

+(NSString*)getClassPropertyTypeString:(void*) property
{
    const char * propName = getPropertyType(property);
    return [NSString stringWithCString:propName encoding:[NSString defaultCStringEncoding]];
}

static const char *getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T') {
            if (strlen(attribute) <= 4) {
                break;
            }
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
        }
    }
    return "@";
}

static BOOL cached_appIsRTL;

+(void)load
{
    [super load];
    
    cached_appIsRTL = UIView.appearance.semanticContentAttribute == UISemanticContentAttributeForceRightToLeft;
}

+(BOOL)appIsRTL
{
    return cached_appIsRTL;
}

+(BOOL)osIsRTL
{
    return [NSLocale characterDirectionForLanguage:[[NSLocale preferredLanguages] objectAtIndex:0]] == NSLocaleLanguageDirectionRightToLeft;
}

+(void)setAppDirection:(UISemanticContentAttribute)attribute
{
    [[UIView appearance] setSemanticContentAttribute:attribute];
    
    [[UINavigationBar appearance] setSemanticContentAttribute:attribute];
    
    cached_appIsRTL = attribute == UISemanticContentAttributeForceRightToLeft;
}

+(void)setAppDirectionAccordingToDevicePrefferedLanguage
{
    if (Utilz.osIsRTL)
        [Utilz setAppDirection:UISemanticContentAttributeForceRightToLeft];
    else
        [Utilz setAppDirection:UISemanticContentAttributeForceLeftToRight];
}

+(void)simulateAppDirectionRTL
{
#ifdef DEBUG
    [Utilz setAppDirection:UISemanticContentAttributeForceRightToLeft];
#endif
}

+(void)simulateAppDirectionLTR
{
#ifdef DEBUG
    [Utilz setAppDirection:UISemanticContentAttributeForceLeftToRight];
#endif
}
+(BOOL)osGreaterThanOrEqualTo:(NSString*)version
{
    return [[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending;
}

+(BOOL)osLessThanOrEqualTo:(NSString*)version
{
    return [[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedDescending;
}

+(BOOL)osBetween:(NSString*)low and:(NSString*)high
{
    return [self osGreaterThanOrEqualTo:low] && [self osLessThanOrEqualTo:high];
}

+(BOOL)isLandscape {
    UIDeviceOrientation deviceOrientation =  UIDevice.currentDevice.orientation;
    if (deviceOrientation != UIDeviceOrientationUnknown && !UIDeviceOrientationIsFlat(deviceOrientation)) {
        return UIDeviceOrientationIsLandscape(deviceOrientation);
    } else {
    // UIDevice.current.orientation sometimes report .unknown. fallback on statusbar orientation:
    return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation);
    }
}

+(BOOL)isPortrait {
    UIDeviceOrientation deviceOrientation =  UIDevice.currentDevice.orientation;;
    if (deviceOrientation != UIDeviceOrientationUnknown && !UIDeviceOrientationIsFlat(deviceOrientation)) {
        return UIDeviceOrientationIsPortrait(deviceOrientation);
    } else {
    // UIDevice.current.orientation sometimes report .unknown. fallback on statusbar orientation:
    return UIInterfaceOrientationIsPortrait(UIApplication.sharedApplication.statusBarOrientation);
    }
}

+(void)setDeviceOrientation:(UIInterfaceOrientation)orientation {
    @try {
        [UIViewController attemptRotationToDeviceOrientation];
        NSNumber *value = [NSNumber numberWithInt:orientation];
        [UIDevice.currentDevice setValue:value forKey:@"orientation"];
        [UIViewController attemptRotationToDeviceOrientation];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

+(BOOL)isIphone {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return true;
    } else {
        return false;
    }
}

+(BOOL)isIpad {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return true;
    } else {
        return false;
    }
}

+(UIBarButtonItem*)barButtonItemWithConf:(UIView* (^)(void))configCallback
{
    
    
    UIView* view = configCallback();
//    view.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItemCustomViewHolder* customViewHolder = [[UIBarButtonItemCustomViewHolder alloc] initWithCustomView:view];
    UIBarButtonItem *theButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customViewHolder];
//    [[customViewHolder rac_signalForSelector:@selector(didMoveToSuperview)] subscribeNext:^(RACTuple * _Nullable x) {
//        NSLog(@"X %@", view);
//        if (customViewHolder.superview) {
//            [customViewHolder nzAlignAllEdgesWithSuperview];
//        }
//    }];
    return theButtonItem;
    
//    UIView* view = configCallback();
//    view.frame = CGRectMake(0, 0, 44, 44);
//    UIBarButtonItem *theButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
//    [[view rac_signalForSelector:@selector(didMoveToSuperview)] subscribeNext:^(RACTuple * _Nullable x) {
//        NSLog(@"X %@", view);
//        if (view.superview) {
//            [view nzAlignAllEdgesWithSuperview];
//        }
//    }];
//    return theButtonItem;
}

+(CGFloat)statusBarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+(CGFloat)rootVCPushDownValue
{
    return CGRectGetMinY([[[[UIApplication sharedApplication] keyWindow] rootViewController] view].frame);
}

+(CGFloat)navBarHeight
{
    return 44.0f;
}

+(CGFloat)deviceWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+(CGFloat)deviceHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}

static CGFloat cached_deviceBottomNotch = 0;
+(CGFloat)deviceBottomNotch
{
    CGFloat result;
    if (@available(iOS 11.0, *)) {
        /*
         This sometimes returns 0. because it somehow asks the very-most forground viewController (event the one that's being pushed) for it's safeAreaInsets. However, until it's viewDidLayoutSubviews or some other methods, the safeAreaInsets won't be set so it returns 0 in some cases. The caching here is set up to return the maximum value that has been seen through the app's lifetime.
         */
        result = UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom;
    } else {
        return 0;
    }
    
    if (cached_deviceBottomNotch > result)
        return cached_deviceBottomNotch;
    
    if (result > cached_deviceBottomNotch)
    {
        cached_deviceBottomNotch = result;
    }
    
    return result;
}

+(BOOL)deviceHasBottomNotch
{
    return [self deviceBottomNotch] > 0;
}

static CGFloat cached_deviceTopNotch = 0;
+(CGFloat)deviceTopNotch
{
    CGFloat result;
    if (@available(iOS 11.0, *)) {
        /*
         This sometimes returns 0. because it somehow asks the very-most forground viewController (event the one that's being pushed) for it's safeAreaInsets. However, until it's viewDidLayoutSubviews or some other methods, the safeAreaInsets won't be set so it returns 0 in some cases. The caching here is set up to return the maximum value that has been seen through the app's lifetime.
         */
        result = UIApplication.sharedApplication.keyWindow.safeAreaInsets.top;
    } else {
        return 0;
    }
    
    if (cached_deviceTopNotch > result)
        return cached_deviceTopNotch;
    
    if (result > cached_deviceTopNotch)
    {
        cached_deviceTopNotch = result;
    }
    
    return result;
}

+(BOOL)deviceHasTopNotch
{
    return [self deviceTopNotch] > 0;
}

+(BOOL)str_ok1:(id)str
{
    return str && [str isKindOfClass:NSString.class];
}

+(BOOL)str_ok2:(id)str
{
    return [self str_ok1:str] && [str length] > 0;
}

+(BOOL)num_ok1:(id)num
{
    return (num && [num isKindOfClass:[NSNumber class]]);
}

+(BOOL)num_ok2:(id)num
{
    return [self num_ok1:num] && [num floatValue] > 0;
}

+(BOOL)arr_ok1:(id)arr
{
    return (arr && [arr isKindOfClass:[NSArray class]]);
}

+(BOOL)arr_ok2:(id)arr
{
    return [self arr_ok1:arr] && [arr count] > 0;
}

+(BOOL)dic_ok1:(id)dic
{
    return (dic && [dic isKindOfClass:[NSDictionary class]]);
}

+(BOOL)dic_ok2:(id)dic
{
    return [self dic_ok1:dic] && [[dic allKeys] count] > 0;
}

+(BOOL)bool_true:(id)num
{
    return (num && [num isKindOfClass:NSNumber.class] && [num boolValue]);
}

+(BOOL)bool_false:(id)num
{
    return (num && [num isKindOfClass:NSNumber.class] && ![num boolValue]);
}

+(NSString *)str_safe:(NSString *)str
{
    return ([self str_ok1:str] ? str : @"");
}

#pragma mark - TopMostController
/*
 got this code from PPTopMostController
 */

+ (UIViewController *)_getModalViewControllerOfControllerIfExists:(UIViewController *)controller {
    UIViewController *toReturn = nil;
    // modalViewController is deprecated since iOS 6, so use presentedViewController instead
    if ([controller respondsToSelector:@selector(presentedViewController)]) toReturn = [controller performSelector:@selector(presentedViewController)];
    else toReturn = [controller performSelector:@selector(modalViewController)];
    
    // If no modal view controller found, return the controller itself
    if (!toReturn) toReturn = controller;
    return toReturn;
}

+ (UIViewController *)topMostController {
    // Start with the window rootViewController
    UIViewController *topController = ((UIWindow *)[[UIApplication sharedApplication].windows objectAtIndex:0]).rootViewController;
    
    // Is there any modal view on top?
    topController = [self _getModalViewControllerOfControllerIfExists:topController];
    
    // Keep reference to the old controller while looping
    UIViewController *oldTopController = nil;
    
    // Loop them all
    while ([topController conformsToProtocol:@protocol(NZTopMostControllerProtocol)] && oldTopController != topController) {
        oldTopController = topController;
        topController = [(UIViewController < NZTopMostControllerProtocol > *) topController visibleViewController];
        // Again, check for any modal controller
        topController = [self _getModalViewControllerOfControllerIfExists:topController];
    }
    
    return topController;
}

//+(RACSignal*)motion2DVectorInterval:(NSTimeInterval)interval
//{
//    return [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        
//        CMMotionManager* motionManager = [CMMotionManager new];
//        RACDisposable* timerDisposable;
//
//        if ([motionManager isDeviceMotionAvailable])
//        {
//            [motionManager setDeviceMotionUpdateInterval:interval];
//            [motionManager startDeviceMotionUpdates];
//
//            timerDisposable = [[RACSignal interval:interval onScheduler:[RACScheduler currentScheduler]] subscribeNext:^(NSDate * _Nullable x) {
//                CMDeviceMotion *currDeviceMotion = motionManager.deviceMotion;
//
//                CGPoint val = CGPointMake(currDeviceMotion.attitude.roll / M_PI, currDeviceMotion.attitude.pitch / M_PI);
//                [subscriber sendNext:[NSValue valueWithCGPoint:val]];
//            }];
//        }
//        else
//            [subscriber sendError:[MyError withErrorString:@"device motion not available" andObject:nil]];
//
//        return [RACDisposable disposableWithBlock:^{
//            [motionManager stopDeviceMotionUpdates];
//            [timerDisposable dispose];
//        }];
//    }] subscribeOn:[RACScheduler schedulerWithPriority:RACSchedulerPriorityDefault]] deliverOnMainThread];
//}

@end
