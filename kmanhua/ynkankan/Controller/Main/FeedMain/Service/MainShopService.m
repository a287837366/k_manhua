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

-(void)getManhuaById:(NSString *)manhuaId response:(void (^)(NSArray *viewArray, NSError *error))response{


    NSString *requsetUrl = [NSString stringWithFormat:@"%@?manhuaid=%@", @"/manhua/getManhuaById.php", manhuaId];
    
    [[HttpClient sharedClient] POST:requsetUrl parameters:nil
                            success:^(NSURLSessionTask *task, id responseObject){
                         
                                    NSData *tempData = [[[[responseObject objectForKey:@"data"] valueForKey:@"viewdetail"] objectAtIndex:0] dataUsingEncoding:NSUTF8StringEncoding];
                                
                                    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:tempData options:NSJSONReadingMutableLeaves error:nil];

                                response(jsonArray , nil);
                                
                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, error);
                            }];


}

-(void)getHotManhuaLists:(void (^)(NSArray *hotManhuas, NSArray *newManhuas, NSError *error))response{
    
    NSString *requsetUrl = @"/manhua/getHotManhuaList.php";
    NSLog(@"getHotManhuaLists>>>>>  %@", requsetUrl);
 
    
    [[HttpClient sharedClient] GET:requsetUrl parameters:nil
                            success:^(NSURLSessionTask *task, id responseObject){
                                
                                
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {
                                    
                                    response(nil, nil, nil);
                                    
                                } else {
                                    
                                    if ([[responseObject objectForKey:@"data"] isEqual:[NSNull null]]) {
                                        
                                        response(nil, nil, nil);
                                        
                                    } else {
                                        
                                        response([responseObject objectForKey:@"data"], [responseObject objectForKey:@"newdata"], nil);
                                        
                                    }
                                    
                                    
                                }

                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
        
                                response(nil, nil, error);
                                
                            }];

}


-(void)getManhuaList:(NSInteger)page response:(void (^)(NSInteger pageSize, NSMutableArray *newManhua, NSMutableArray *freeManhua, NSError *error))response{

    NSString *requsetUrl = [NSString stringWithFormat:@"%@?page=%ld", @"/manhua/getManhuaList.php", (long)page];
    
    [[HttpClient sharedClient] POST:requsetUrl parameters:nil
                            success:^(NSURLSessionTask *task, id responseObject){
                                
                                
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {

                                    response([[responseObject objectForKey:@"count"] intValue], nil, nil, nil);
                                
                                } else {
                                   
                                    if ([[responseObject objectForKey:@"freedata"] isEqual:[NSNull null]]) {
                                    
                                        response([[responseObject objectForKey:@"count"] intValue], nil, nil, nil);
                                    
                                    } else {
                                       
                                        NSLog(@" >>>>>> %@ ", [responseObject objectForKey:@"newdata"]);
                                        
                                        response([[responseObject objectForKey:@"count"] intValue], [responseObject objectForKey:@"newdata"], [responseObject objectForKey:@"freedata"], nil);
                                    
                                    }
                                    

                                }

                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(0, nil, nil, error);
                            }];

}

@end
