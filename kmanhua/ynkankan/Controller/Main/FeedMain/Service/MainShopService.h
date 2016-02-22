//
//  MainShopService.h
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"

@interface MainShopService : NSObject

-(void)getManhuaList:(NSInteger)page response:(void (^)(NSInteger pageSize,NSMutableArray *newManhua, NSMutableArray *freeManhua, NSError *error))response;


-(void)getManhuaById:(NSString *)manhuaId response:(void (^)(NSArray *viewArray,NSError *error))response;

@end
