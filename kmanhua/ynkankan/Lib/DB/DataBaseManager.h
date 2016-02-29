//
//  DataBaseManager.h
//  ynkankan
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseManager : NSObject

+ (DataBaseManager *)shareInstance;

-(void)createManhuaTable;

-(BOOL)isFav:(NSString *)manhuaId;

-(void)insertManhua:(NSString *)manhuaId manhuaName:(NSString *)manhuaName;

-(void)deleteManhua:(NSString *)manhuaId;

-(NSMutableArray *)getManhuaHistroy;

@end
