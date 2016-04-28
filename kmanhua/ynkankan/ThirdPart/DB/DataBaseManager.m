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
            
            NSString *createTableSQL = @"CREATE TABLE T_MANHUA (key_id integer PRIMARY KEY autoincrement, m_uid varchar, m_title text, m_icon text, m_createTime text, m_fromdata text, u_phoneno text, m_type text)";
            [db executeUpdate:createTableSQL];
            
        }
        
    }];
    
}

-(void)insertManhua:(NewsModel *)model{

    NSString *sql_Insert = [NSString stringWithFormat:@"insert into T_MANHUA (m_uid, m_title, m_icon, m_createTime, m_fromdata, u_phoneno, m_type) values ('%@', '%@', '%@', '%@', '%@', '%@', '%@')", model.m_uid, model.m_title,model.m_icon ,model.m_createTime , model.m_fromdata, model.u_phoneno, model.m_type];
    
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

-(void)deleteAllManhua{

    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    if (queue==nil) {
        return;
    }
    
    NSString *sql_delelte = @"delete from T_MANHUA";
    
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
    
    __block NSMutableArray *manhuaArray = [[NSMutableArray alloc] init];
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    
    NSString *sql_select = [NSString stringWithFormat:@"select * from T_MANHUA"];
    
    [queue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *rs = [db executeQuery:sql_select];
        
        NewsModel *model;
        
        while ([rs next]) {

            model = [[NewsModel alloc] init];
            model.m_createTime = [rs stringForColumn:@"m_createTime"];
            model.m_fromdata = [rs stringForColumn:@"m_fromdata"];
            model.m_icon = [rs stringForColumn:@"m_icon"];
            model.m_title = [rs stringForColumn:@"m_title"];
            model.m_uid = [rs stringForColumn:@"m_uid"];
            model.u_phoneno = [rs stringForColumn:@"u_phoneno"];
            model.m_type = [rs stringForColumn:@"m_type"];
            [manhuaArray addObject:model];
        }
    }];


    [queue close];
    return manhuaArray;
}

@end
