//
//  LoginService.m
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "LoginService.h"
#import "ToolsClass.h"

@implementation LoginService

-(void)requsetLogin:(NSString *)loginId loginPw:(NSString *)loginPw response:(void (^)(NSMutableDictionary *returnDic, NSError *error))response{
    
    NSDictionary *paramDic = @{@"username" : loginId , @"password" : [ToolsClass stringToMd5:loginPw]};
//    NSLog(@" %@ " , paramDic);
    [[HttpClient sharedClient] POST:@"login" parameters:paramDic
        success:^(NSURLSessionTask *task, id responseObject){
            NSLog(@" %@ ", responseObject);
          
            response(responseObject, nil);
        } failure:^(NSURLSessionTask *task, NSError *error){

            response(nil, error);
        }];

}


@end
