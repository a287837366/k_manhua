//
//  UserSharePrefre.h
//  ynkankan
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserSharePrefre : NSObject

+(UserSharePrefre *) sharedInstance;

-(NSString *)userId;
-(NSString *)userpw;
-(NSString *)UUID;
-(NSString *)nikeName;

-(BOOL)isLogin;

-(void)refreshUserByDic:(NSMutableDictionary *)dic;

-(void)clearUser;

@end
