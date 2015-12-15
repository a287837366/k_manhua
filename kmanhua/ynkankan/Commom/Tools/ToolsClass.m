//
//  ToolsClass.m
//  ynkankan
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "ToolsClass.h"
#import <CommonCrypto/CommonDigest.h>


@implementation ToolsClass

#pragma mark 转MD5
+ (NSString *)stringToMd5:(NSString *)once{

    const char* cStr = [once UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
    
}

#pragma mark 字符串转SHA1
+ (NSString *)stringToSHA1:(NSString *)once{
    NSString *onceAndKey = [NSString stringWithFormat:@"dca70580006271475a9d6c04c8219d3c%@", once];
    const char *cstr = [onceAndKey cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:onceAndKey.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (int)data.length, digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

#pragma mark 根据内容拿到 控件宽度
+(CGSize) boundingRectWithSize:(NSString*) txt Font:(UIFont*) font size:(CGSize)size{
    CGSize _size;
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    NSStringDrawingOptions options =
    NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    _size = [txt boundingRectWithSize:size options: options attributes:attribute context:nil].size;
    
    return _size;
}



@end
