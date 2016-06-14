//
//  HttpClient.m
//  ynkankan
//
//  Created by aspn300 on 15/10/16.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "HttpClient.h"

//#define KANKAN_HTTP_BASEURL @"http://180.76.151.128:8080/"
#define KANKAN_HTTP_BASEURL @"http://192.168.1.106:8080/"



@implementation HttpClient


+ (instancetype) sharedClient{
    static HttpClient *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{

        _sharedClient = [[HttpClient alloc] initWithBaseURL:[NSURL URLWithString:KANKAN_HTTP_BASEURL]];
        
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain; charset=utf-8"];
        [_sharedClient.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField:@"Content-type"];
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];

        
    });
    
    return _sharedClient;


}

+ (instancetype) sharedClientUpdateImage{
    
    static HttpClient *_sharedClientImage = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedClientImage = [[HttpClient alloc] initWithBaseURL:[NSURL URLWithString:KANKAN_HTTP_BASEURL]];
        
        _sharedClientImage.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        [_sharedClientImage.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-type"];
        //        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        
    });
    
    return _sharedClientImage;

}

@end
