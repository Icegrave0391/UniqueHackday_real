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
    __block FMResultSet * chanceSet ;
    __block FMResultSet * articleSet ;
    __block FMResultSet * webArticleSet ;
    __block FMResultSet * knowledgeCourseArrSet ;
    __block FMResultSet * knowledgeArticleArrSet ;
    __block FMResultSet * skillMajorSkillArrSet ;
    __block FMResultSet * skillWebArrSet ;
    __block FMResultSet * skillStrategyArrSet ;
    
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
        [User sharedUser].major.ID = [User sharedUser].ID ;
        //employment -> companyInfo & chanceArr
        companySet =[db executeQuery:@"SELECT * FROM companyInfo"] ;
        while([companySet next]){
            Company * company = [[Company alloc] init] ;
            company.ID = [User sharedUser].ID ;
            company.companyID = [companySet intForColumn:@"companyid"] ;
            company.companyName = [companySet stringForColumn:@"companyName"] ;
            company.companyInfo = [companySet stringForColumn:@"companyInfo"] ;
            //company -> chanceArr
            chanceSet = [db executeQuery:@"SELECT * FROM chance where companyid = ?",company.companyID] ;
            while ([chanceSet next]) {
                Chance * chance = [[Chance alloc] init] ;
                chance.content = [chanceSet stringForColumn:@"content"] ;
                chance.time = [chanceSet dateForColumn:@"time"] ;
                [company.chanceArr addObject:chance] ;
            }
            [[User sharedUser].major.employment.companyArr addObject:company] ;
        }
        //employment -> newsArr
        articleSet = [db executeQuery:@"SELECT * FROM article where type = ?",@"employmentNewsType"] ;
        while ([articleSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [articleSet dateForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[articleSet dataForColumn:@"image"]] ;
            article.content = [articleSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.employment.newsArr addObject:article] ;
        }
        //employment -> webArr
        webArticleSet = [db executeQuery:@"SELECT * FROM article where type = ?",@"employmentWebType"] ;
        while ([webArticleSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [webArticleSet dateForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[webArticleSet dataForColumn:@"image"]] ;
            article.content = [webArticleSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.employment.webArr addObject:article] ;
        }
        //knowledge -> courseArr
        knowledgeCourseArrSet = [db executeQuery:@"SELECT * FROM article where type = ?",@"knowledgeCourseType"] ;
        while ([knowledgeCourseArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [knowledgeCourseArrSet dateForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[knowledgeCourseArrSet dataForColumn:@"image"]] ;
            article.content = [knowledgeCourseArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.knowledge.courseArr addObject:article] ;
        }

        //knowledge -> articleArr
        knowledgeArticleArrSet = [db executeQuery:@"SELECT * FROM article where type = ?",@"knowledgeArticleType"] ;
        while ([knowledgeArticleArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [knowledgeArticleArrSet dateForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[knowledgeArticleArrSet dataForColumn:@"image"]] ;
            article.content = [knowledgeArticleArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.knowledge.articleArr addObject:article] ;
        }
        //skill -> majorSkill
        skillMajorSkillArrSet = [db executeQuery:@"SELECT * FROM article where type = ?",@"majorSkillType"] ;
        while ([skillMajorSkillArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [skillMajorSkillArrSet dateForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[skillMajorSkillArrSet dataForColumn:@"image"]] ;
            article.content = [skillMajorSkillArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.skill.majorSkillArr addObject:article] ;
        }
        //skill -> webArr
        skillWebArrSet = [db executeQuery:@"SELECT * FROM article where type = ?",@"skillWebType"] ;
        while ([skillWebArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [skillWebArrSet dateForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[skillWebArrSet dataForColumn:@"image"]] ;
            article.content = [skillWebArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.skill.webArr addObject:article] ;
        }
        //skill -> strategyArr
        skillStrategyArrSet = [db executeQuery:@"SELECT * FROM article where type = ?",@"skillStrategyType"] ;
        while ([skillStrategyArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [skillStrategyArrSet dateForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[skillStrategyArrSet dataForColumn:@"image"]] ;
            article.content = [skillStrategyArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.skill.strategyArr addObject:article] ;
        }
    }] ;
}


@end

