//
//  DataBaseManager.m
//  ynkankan
//
//  Created by apple on 16/1/19.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "DataBaseManager.h"
#import "DBHelper.h"

static NSString * const addressTableName = @"CITYTABLE";

@implementation DataBaseManager

+ (DataBaseManager *)shareInstance{

    static DataBaseManager* instance = nil;
    static dispatch_once_t predicate;
   
    dispatch_once(&predicate, ^{
     
        instance = [[[self class] alloc] init];
    
    });
  
    return instance;
    
}

-(void)createHistoryTable{
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    if (queue==nil) {
        return;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
        if (![DBHelper isTableOK: @"" withDB:db]) {
            
//            NSString *createTableSQL = @"CREATE TABLE CITYTABLE (parent_id text,relate_path text, zone_id text, zone_name text)";
//            [db executeUpdate:createTableSQL];
            
        }
        
    }];
}

//-(BOOL)hasAddress{
//    
//    __block BOOL hasData = NO;
//    
//    FMDatabaseQueue *queue = [YmDbHelper getDatabaseQueue];
//    [queue inDatabase:^(FMDatabase *db) {
//        FMResultSet *rs = [db executeQuery:@"SELECT count(*) as 'count' FROM CITYTABLE"];
//        
//        //        FMResultSet *rs = [db executeQuery:@"SELECT * FROM CITYTABLE"];
//        
//        while ([rs next]) {
//            
//            NSInteger count = [rs intForColumn:@"count"];
//            
//            if (0 == count)
//            {
//                
//                
//                hasData =  NO;
//            }
//            else
//            {
//                hasData = YES;
//            }
//            
//        }
//        
//        NSLog(@"  %@ ", hasData? @"有": @"无");
//        [rs close];
//    }];
//    
//    
//    return hasData;
//    
//}


@end
