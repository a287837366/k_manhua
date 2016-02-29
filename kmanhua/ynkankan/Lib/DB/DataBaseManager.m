//
//  DataBaseManager.m
//  ynkankan
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "DataBaseManager.h"
#import "DBHelper.h"

@implementation DataBaseManager

+ (DataBaseManager *)shareInstance{

    static DataBaseManager* instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
        [instance createManhuaTable];
    });
    return instance;
    
}

-(void)createManhuaTable{
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    if (queue==nil) {
        return;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
        if (![DBHelper isTableOK: @"T_MANHUA" withDB:db]) {
            
            NSString *createTableSQL = @"CREATE TABLE T_MANHUA (key_id integer PRIMARY KEY autoincrement, m_uid varchar, m_name text)";
            [db executeUpdate:createTableSQL];
            
        }
        
    }];
    
}

-(void)insertManhua:(NSString *)manhuaId manhuaName:(NSString *)manhuaName{

    NSString *sql_Insert = [NSString stringWithFormat:@"insert into T_MANHUA (m_uid, m_name) values ('%@', '%@')", manhuaId, manhuaName];
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    if (queue==nil) {
        return;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:sql_Insert];
    }];

    [queue close];
}

-(void)deleteManhua:(NSString *)manhuaId{
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    if (queue==nil) {
        return;
    }
    
    NSString *sql_delelte = [NSString stringWithFormat:@"delete from T_MANHUA where m_uid = '%@'", manhuaId];
    
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:sql_delelte];
    }];
    
    [queue close];
}

-(BOOL)isFav:(NSString *)manhuaId{

    __block BOOL hasData = NO;
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    [queue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM T_MANHUA where m_uid = ?", manhuaId];
        while ([rs next]) {
            hasData = YES;
        }
        
    }];
    
    [queue close];
    
    return hasData;
}

-(NSMutableArray *)getManhuaHistroy{
    
    __weak NSMutableArray *manhuaArray = [[NSMutableArray alloc] init];
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    NSString *sql_select = [NSString stringWithFormat:@"select * from T_MANHUA"];
    
    [queue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *rs = [db executeQuery:sql_select];
        
        while ([rs next]) {
            NSLog(@" %@  %@", [rs stringForColumn:@"m_uid"], [rs stringForColumn:@"m_name"]);
//            cityModel = [[CityModel alloc] init];
//            cityModel.paretId = [rs stringForColumn:@"parent_id"];
//            cityModel.relatePath = [rs stringForColumn:@"relate_path"];
//            cityModel.zoneId = [rs stringForColumn:@"zone_id"];
//            cityModel.zoneName = [rs stringForColumn:@"zone_name"];
//            
        }
        
    }];


    [queue close];
    return manhuaArray;
}

@end
