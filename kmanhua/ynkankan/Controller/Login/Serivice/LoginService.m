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
    NSLog(@"user/getByUserId.php");
    [[HttpClient sharedClient] POST:@"/user/getByUserId.php" parameters:@{@"username" : loginId , @"userpw" : loginPw}
        success:^(NSURLSessionTask *task, id responseObject){
            NSLog(@"  %@  ", responseObject);
            if ([[responseObject objectForKey:@"error"] integerValue] != 0) {
                response(nil, nil);
            } else {
                response([responseObject objectForKey:@"data"], nil);
            }

        } failure:^(NSURLSessionTask *task, NSError *error){
            response(nil, error);
        }];

}


-(void)registerUser:(NSMutableDictionary *)paramDic response:(void (^)(NSString *success, NSError *error))response{
    
    [[HttpClient sharedClient] POST:@"/user/postUserInfo.php" parameters:paramDic
                            success:^(NSURLSessionTask *task, id responseObject){
                                NSLog(@" %@ ", responseObject);
                                if ([[responseObject objectForKey:@"error"] integerValue] != 0) {
                                    response(nil, nil);
                                } else {
                                    response(@"1", nil);
                                }
                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, error);
                            }];

}


-(void)updateNikeName:(NSDictionary *)paramDic response:(void (^)(NSString *success, NSError *error))response
{

    [[HttpClient sharedClient] POST:@"/user/postupdateUser.php" parameters:paramDic
                            success:^(NSURLSessionTask *task, id responseObject){
                                NSLog(@" %@ ", responseObject);
                                if ([[responseObject objectForKey:@"error"] integerValue] != 0) {
                                    response(nil, nil);
                                } else {
                                    response(@"1", nil);
                                }
                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, error);

                            }];



}

@end
