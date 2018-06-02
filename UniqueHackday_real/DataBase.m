//
//  DataBase.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//


#import "DataBase.h"
#import <FMDB.h>


static DataBase *tool;



@implementation DataBase

+ (instancetype)sharedDB {
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        tool = [[DataBase alloc] init];
        [tool getQueue] ;
    });
    return tool;
}

#pragma mark - Get Queue
//获得队列
- (FMDatabaseQueue *)getQueue {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"major.sqlite"]];
    NSLog(@"major db ----path    %@", path);
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:path];
    //建表
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        //majorInfo
        NSString * majorInfoSql = @"CREATE TABLE IF NOT EXISTS 'majorInfo' ('id' INTEGER NOT NULL ,'majorName' VARCHAR(255),'definition' TEXT,'direction' TEXT,'knowledge' TEXT, 'skill' TEXT,'subject' TEXT) ";
        //companyInfo
        NSString * companySql = @"CREATE TABLE IF NOT EXISTS 'companyInfo' ('companyid' INTEGER NOT NULL ,'companyName' VARCHAR(255),'companyInfo' TEXT) ";
        //chance
        NSString * chanceSql = @"CREATE TABLE IF NOT EXISTS 'chance' ('companyid' INTEGER NOT NULL ,'content' TEXT,'time' DATETIME) ";
        //article
        NSString * articleSql = @"CREATE TABLE IF NOT EXISTS 'article' ('id' INTEGER NOT NULL ,'type' VARCHAR(255),'content' TEXT,'time' DATETIME,'image' BLOB) ";
        //user
        NSString * userSql = @"CREATE TABLE IF NOT EXISTS 'user' ('id' INTEGER NOT NULL ,'username' VARCHAR(255),'password' TEXT) ";
        [db executeUpdate:majorInfoSql] ;
        [db executeUpdate:companySql] ;
        [db executeUpdate:chanceSql] ;
        [db executeUpdate:articleSql] ;
        [db executeUpdate:userSql] ;
    }];
    return queue;
}

//-(void)updateMajor:(Major *)major andCompany:(Company *)company and{
//
//   [[self getQueue] inDatabase:^(FMDatabase * _Nonnull db) {
//       [db executeUpdate:@"UPDATE 'majorInfo' majorName = ?  WHERE id = ?",major.majorName,[User sharedUser].ID];
//       [db executeUpdate:@"UPDATE 'majorInfo' SET definition = ? direction = ? knowledge = ? skill = ? WHERE id = ?",major.majorInfo.definition,major.majorInfo.definition,major.majorInfo.knowledge,major.majorInfo.skill,[User sharedUser].ID] ;
//       [db executeUpdate:@"UPDATE 'companyInfo' SET companyid = ? companyName = ? companyInfo = ? WHERE id = ?",company.companyID,company.companyName,company.companyInfo,[User sharedUser].ID] ;
//       [db executeUpdate:@"UPDATE 'chance' SET companyid "]
//   }];
//}

-(void)getUserAllInfo{
    __block FMResultSet * majorSet ;
    __block FMResultSet * userSet ;
    __block FMResultSet * companySet ;
    [[self getQueue] inDatabase:^(FMDatabase * _Nonnull db) {
        //majorInfo
        majorSet = [db executeQuery:@"SELECT * FROM majorInfo"] ;
        [User sharedUser].major.majorName = [majorSet stringForColumn:@"majorName"] ;
        [User sharedUser].major.majorInfo.definition = [majorSet stringForColumn:@"definition"] ;
        [User sharedUser].major.majorInfo.direction = [majorSet stringForColumn:@"direction"] ;
        [User sharedUser].major.majorInfo.knowledge = [majorSet stringForColumn:@"knowledge"] ;
        [User sharedUser].major.majorInfo.skill = [majorSet stringForColumn:@"skill"] ;
        [User sharedUser].major.majorInfo.subject = [majorSet stringForColumn:@"subject"] ;
        //userInfo
        userSet = [db executeQuery:@"SELECT * FROM user"] ;
        [User sharedUser].userName = [userSet stringForColumn:@"userName"] ;
        [User sharedUser].password = [userSet stringForColumn:@"password"] ;
        [User sharedUser].ID = [userSet intForColumn:@"id"] ;
        //companyInfo
        companySet =[db executeQuery:@"SELECT * FROM companyInfo"] ;
        while([companySet next]){
            Company * company = [[Company alloc] init] ;
            company.companyID = [companySet intForColumn:@""] ;
        }
    }] ;
}
@end

