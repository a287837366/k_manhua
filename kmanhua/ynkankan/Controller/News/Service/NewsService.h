//
//  NewsService.h
//  ynkankan
//
//  Created by aspn300 on 15/12/27.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsService : NSObject

@property (nonatomic, assign) NSInteger *weixinPage;

-(void)getWeixinList:(NSInteger)page response:(void (^)(NSMutableArray *newWeixin, NSError *error))response;

@end
