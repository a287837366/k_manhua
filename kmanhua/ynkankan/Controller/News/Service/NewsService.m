//
//  NewsService.m
//  ynkankan
//
//  Created by aspn300 on 15/12/27.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "NewsService.h"
#import "HttpClient.h"

@implementation NewsService

-(void)getWeixinList:(NSInteger)page response:(void (^)(NSMutableArray *newWeixin, NSError *error))response{
    
    NSString *requsetUrl = [NSString stringWithFormat:@"%@?page=%ld", @"/weixin/getWeixinList.php", (long)self.weixinPage];
    
    [[HttpClient sharedClient] POST:requsetUrl parameters:nil
                            success:^(NSURLSessionTask *task, id responseObject){
                                
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {
                                    
                                    response(nil, nil);
                                    
                                } else {

                                    if ([[responseObject objectForKey:@"data"] isEqual:[NSNull null]]) {
                                        response(nil, nil);
                                    } else {
                                        NSLog(@" %@ ", responseObject);
                                        
                                        if ([[responseObject objectForKey:@"data"] count] != 0) {
                                            self.weixinPage ++;
                                        }
                                        
                                        response([responseObject objectForKey:@"data"], nil);
                                    }
                                    
                                    
                                }
                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, error);
                            }];


}

@end
