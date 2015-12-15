//
//  ToolsClass.h
//  ynkankan
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolsClass : NSObject

#pragma mark 转MD5
+ (NSString *)stringToMd5:(NSString *)once;

#pragma mark 字符串转SHA1
+ (NSString *)stringToSHA1:(NSString *)once;

@end
