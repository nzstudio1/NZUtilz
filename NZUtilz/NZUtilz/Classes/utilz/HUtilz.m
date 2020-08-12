//
//  HUtilz.m
//  NZStudio
//
//  Created by H. Vakilian on 9/9/2020.
//  Copyright © 2020 NZStudio. All rights reserved.
//


#import "HUtilz.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation HUtilz

+(NSString*)hmacForKey:(NSString*)key andData:(NSString*)data //hmacsha256 algorithm
{
    NSString * parameters = data;
    NSString *salt = key;
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    NSData *paramData = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    int cc_length = CC_SHA256_DIGEST_LENGTH;
    CCHmacAlgorithm cc_algorithm = kCCHmacAlgSHA256;
    unsigned char cHMAC[cc_length];
    CCHmac(cc_algorithm, saltData.bytes, saltData.length, paramData.bytes, paramData.length, cHMAC);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:cc_length * 2];
    
    for(int i = 0; i < cc_length; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    return output;
}


@end
