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

@interface MainShopService : NSObject

-(void)getManhuaList:(NSInteger)page type:(NSInteger)type response:(void (^)(NSMutableArray *freeManhua, NSInteger pageCount, NSError *error))response;

@end
