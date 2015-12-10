//
//  HttpClient.m
//  ynkankan
//
//  Created by aspn300 on 15/10/16.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "HttpClient.h"

#define KANKAN_HTTP_BASEURL @"http://localhost:8080/kankan123/"
//#define KANKAN_HTTP_BASEURL @"https://api.app.net/"

@implementation HttpClient


+ (instancetype) sharedClient{
    static HttpClient *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[HttpClient alloc] initWithBaseURL:[NSURL URLWithString:KANKAN_HTTP_BASEURL]];
        
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
    });
    
    return _sharedClient;


}

@end
