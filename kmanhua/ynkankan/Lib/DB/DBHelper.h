//
//  DBHelper.h
//  ynkankan
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface DBHelper : NSObject

+(FMDatabaseQueue *) getDatabaseQueue;

+(BOOL) isTableOK:(NSString *)tableName withDB:(FMDatabase *)db;

@end
