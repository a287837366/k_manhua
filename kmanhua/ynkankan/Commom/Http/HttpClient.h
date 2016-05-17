//
//  HttpClient.h
//  ynkankan
//
//  Created by aspn300 on 15/10/16.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "ToolsClass.h"

#define kankanAppId @"dca70580006271475a9d6c04c8219d3c"

@interface HttpClient : AFHTTPSessionManager

+ (instancetype) sharedClient;

+ (instancetype) sharedClientUpdateImage;

@end
