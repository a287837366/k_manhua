//
//  ToolsClass.h
//  ynkankan
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppConstant.h"
#import "WXApi.h"
@interface ToolsClass : NSObject

#pragma mark 转MD5
+ (NSString *)stringToMd5:(NSString *)once;

#pragma mark 字符串转SHA1
+ (NSString *)stringToSHA1:(NSString *)once;

#pragma mark 根据内容拿到 控件宽度
+ (CGSize)boundingRectWithSize:(NSString*) txt Font:(UIFont*) font size:(CGSize)size;

+(BOOL)isWechatInstalled;

@end
