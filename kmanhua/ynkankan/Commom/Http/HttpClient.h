//
//  HttpClient.h
//  ynkankan
//
//  Created by aspn300 on 15/10/16.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HttpClient : AFHTTPSessionManager

+ (instancetype) sharedClient;

@end
