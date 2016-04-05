//
//  UserSharePrefre.m
//  ynkankan
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "UserSharePrefre.h"

#define ShareUserId @"ShareUserId"
#define ShareUserPw @"ShareUserPw"

static UserSharePrefre *sharedObj = nil;

@interface UserSharePrefre(){

    NSString *userId;
    NSString *userPw;
    NSString *iosUUID;
}

@end

@implementation UserSharePrefre

+(UserSharePrefre *) sharedInstance{
    
    @synchronized (self){
       
        if (sharedObj == nil)
        {
            sharedObj = [[self alloc] init];
            

        }
    
    }
    
    
    return sharedObj;
}

-(instancetype)init{

    if (self = [super init]) {
        NSUserDefaults *defualts = [NSUserDefaults standardUserDefaults];
        userId = [defualts objectForKey:ShareUserId];
        userPw = [defualts objectForKey:ShareUserPw];
        iosUUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
    }

    return self;
}

-(BOOL)isLogin{

    if (userId == nil) {
        NSLog(@" --未登入-- ");
        return NO;
    }
    
    NSLog(@" --已登入-- ");
    return YES;
}

-(NSString *)UUID{
    return iosUUID;
}

-(NSString *)userId{

    return userId;
}

-(NSString *)userpw{
    
    return userPw;
}


-(void)refreshUserByDic:(NSMutableDictionary *)dic{
    
    
    NSUserDefaults *defualts = [NSUserDefaults standardUserDefaults];
    [defualts setObject:[dic objectForKey:@"username"] forKey:ShareUserId];
    [defualts setObject:[dic objectForKey:@"userpw"] forKey:ShareUserPw];
    
    userId = [dic objectForKey:@"username"];
    userPw = [dic objectForKey:@"userpw"];

}

-(void)clearUser{

    
    userId = nil;
    userPw = nil;

    NSUserDefaults *defualts = [NSUserDefaults standardUserDefaults];
    [defualts setObject:nil forKey:ShareUserId];
    [defualts setObject:nil forKey:ShareUserPw];
}



@end
