//
//  MainShopService.m
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopService.h"

#define page_Size 10

@implementation MainShopService

-(void)getManhuaList:(NSInteger)page response:(void (^)(NSMutableArray *newManhua, NSMutableArray *freeManhua, NSError *error))response{
  
    NSString *requsetUrl = [NSString stringWithFormat:@"%@?page=%ld", @"/manhua/getManhuaList.php", (long)page];
    
    [[HttpClient sharedClient] POST:requsetUrl parameters:nil
                            success:^(NSURLSessionTask *task, id responseObject){
                                
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {

                                    response(nil, nil, nil);
                                
                                } else {
                                   
                                    response([responseObject objectForKey:@"newdata"], [responseObject objectForKey:@"freedata"], nil);
                                }

                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, nil, error);
                            }];

}

@end
