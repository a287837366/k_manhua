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

-(void)getManhuaList:(NSInteger)page response:(void (^)(NSMutableArray *freeManhua,  NSInteger pageCount, NSError *error))response{
  
    NSString *requsetUrl = [NSString stringWithFormat:@"%@?page=%ld", @"/manhua/getManhuaList.php", (long)page];
    
    [[HttpClient sharedClient] POST:requsetUrl parameters:nil
                            success:^(NSURLSessionTask *task, id responseObject){
                                
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {

                                    response(nil, 0, nil);
                                
                                } else {
                                   
                                    if ([[responseObject objectForKey:@"data"] isEqual:[NSNull null]]) {
                                        response(nil, 0, nil);
                                    } else {
                                        response([responseObject objectForKey:@"data"], [[responseObject objectForKey:@"count"] intValue], nil);
                                    }
                                    

                                }

                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, 0, error);
                            }];

}

@end
