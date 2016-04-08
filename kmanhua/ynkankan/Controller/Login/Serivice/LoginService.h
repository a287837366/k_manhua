//
//  LoginService.h
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"

@interface LoginService : NSObject

-(void)requsetLogin:(NSString *)loginId loginPw:(NSString *)loginPw response:(void (^)(NSMutableDictionary *returnDic, NSError *error))response;

-(void)registerUser:(NSMutableDictionary *)paramDic response:(void (^)(NSString *success, NSError *error))response;

-(void)updateNikeName:(NSDictionary *)paramDic response:(void (^)(NSString *success, NSError *error))response;

@end
