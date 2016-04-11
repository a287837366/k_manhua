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
/**
 *0.全部 1.招聘信息 2. 求职信息 3.房产信息 4.宠物信息
 *
 */
-(void)getManhuaList:(NSInteger)page type:(NSInteger)type response:(void (^)(NSMutableArray *freeManhua,  NSInteger pageCount, NSError *error))response{
  
    NSString *requsetUrl = [NSString stringWithFormat:@"%@?page=%ld&type=%ld", @"/manhua/getManhuaList.php", (long)page, type];
    
    [[HttpClient sharedClient] POST:requsetUrl parameters:nil
                            success:^(NSURLSessionTask *task, id responseObject){
                                
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {

                                    response(nil, 0, nil);
                                
                                } else {
                                   
                                    if ([[responseObject objectForKey:@"data"] isEqual:[NSNull null]]) {
                                        response(nil, 0, nil);
                                    } else {
                                        
                                        NSMutableArray *array = [[NSMutableArray alloc] init];
                                        
                                        for (NSMutableDictionary *dic in [responseObject objectForKey:@"data"]) {
                                            
                                            NewsModel *model = [[NewsModel alloc] init];
                                            model.m_uid = [dic objectForKey:@"m_uid"];
                                            model.m_fromdata = [dic objectForKey:@"m_fromdata"];
                                            model.m_icon = [dic objectForKey:@"m_icon"];
                                            model.m_createTime = [dic objectForKey:@"m_createTime"];
                                            model.m_title = [dic objectForKey:@"m_title"];
                                            
                                            [array addObject:model];
                                        }
                                        
                                        
                                        response(array, array.count, nil);
                                    }
                                    

                                }

                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, 0, error);
                            }];

}

@end
