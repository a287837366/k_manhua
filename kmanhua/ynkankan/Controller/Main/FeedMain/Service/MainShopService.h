//
//  MainShopService.h
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"
#import "NewsModel.h"
#import "YMImage.h"

@interface MainShopService : NSObject

-(void)getManhuaList:(NSInteger)page type:(NSInteger)type response:(void (^)(NSMutableArray *freeManhua, NSInteger pageCount, NSError *error))response;

-(void)getManhuaById:(NSString *)manhuaId response:(void (^)(NSMutableDictionary *manhuaDic, NSError *error))response;

-(void)updateManhuaContent:(NSMutableDictionary *)dic response:(void (^)(NSMutableDictionary *freeManhua, NSError *error))response;

-(void)updateImage:(NSMutableArray *)imageArray response:(void (^)(NSMutableDictionary *freeManhua, NSError *error))response;

-(void)checkUpPermisson:(void (^)(NSString *returnCode, NSError *error))response;

@end
