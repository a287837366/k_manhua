//
//  WeiXin.h
//  uniplaza
//  微信分享
//  Created by Xi Jin on 19/08/2015.
//  Copyright (c) 2015 YouMi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDWebImageDownloader.h"
#import "WXApiObject.h"
#import "WXApi.h"

typedef void(^WXShareComplete)(BOOL success);

@interface WeiXin : NSObject

#pragma mark - 微信分享

+(void)WeixinShare:(NSString *)title andDesc:(NSString *)desc andUrl:(NSString *)link withImgUrl:(NSString *)imgUrl isGroup:(BOOL)isGroup;

+(void)WeixinShare:(NSString *)title andDesc:(NSString *)desc andUrl:(NSString *)link withImgUrl:(NSString *)imgUrl isGroup:(BOOL)isGroup complate:(WXShareComplete) complate;

//分享本地下载图片
+(void)WeixinShare:(NSString *)title andDesc:(NSString *)desc andUrl:(NSString *)link image:(UIImage *)image isGroup:(BOOL)isGroup;

@end
