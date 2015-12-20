//
//  HttpClient.m
//  ynkankan
//
//  Created by aspn300 on 15/10/16.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "HttpClient.h"

#define KANKAN_HTTP_BASEURL @"http://1.85kankan.sinaapp.com/"
//#define KANKAN_HTTP_BASEURL @"https://api.app.net/"

@implementation HttpClient


+ (instancetype) sharedClient{
    static HttpClient *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{

        _sharedClient = [[HttpClient alloc] initWithBaseURL:[NSURL URLWithString:KANKAN_HTTP_BASEURL]];
        
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];

        
    });
    
    return _sharedClient;


}

@end
