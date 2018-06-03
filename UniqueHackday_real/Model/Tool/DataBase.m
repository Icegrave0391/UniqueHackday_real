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
        NSString * companySql = @"CREATE TABLE IF NOT EXISTS 'companyInfo' ('companyid' INTEGER NOT NULL,'companyName' VARCHAR(255),'companyInfo' TEXT) ";
        //chance
        NSString * chanceSql = @"CREATE TABLE IF NOT EXISTS 'chance' ('companyid' INTEGER NOT NULL,'content' TEXT,'time' TEXT) ";
        //article
        NSString * articleSql = @"CREATE TABLE IF NOT EXISTS 'article' ('id' INTEGER NOT NULL,'type' VARCHAR(255),'content' TEXT,'time' TEXT,'image' BLOB) ";
        //user
        NSString * userSql = @"CREATE TABLE IF NOT EXISTS 'user' ('id' INTEGER NOT NULL,'username' VARCHAR(255),'password' TEXT) ";
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
    __block FMResultSet * knowledgeMajorCourseArrSet ;
    __block FMResultSet * knowledgeMajorArticleArrSet ;
    __block FMResultSet * knowledgeCrossCourseArrSet ;
    __block FMResultSet * knowledgeCrossArticleArrSet ;
    __block FMResultSet * skillMajorSkillArrSet ;
    __block FMResultSet * skillWebArrSet ;
    __block FMResultSet * skillStrategyArrSet ;
    
    [[self getQueue] inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        majorSet = [db executeQuery:@"SELECT * FROM majorInfo"] ;
        userSet = [db executeQuery:@"SELECT * FROM user"] ;
        companySet =[db executeQuery:@"SELECT * FROM companyInfo"] ;
                    chanceSet = [db executeQuery:@"SELECT * FROM chance order by time desc"] ;
        articleSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"employmentNewsType"] ;
        webArticleSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"employmentWebType"] ;
        knowledgeMajorCourseArrSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"knowledgeMajorCourseType"] ;
        knowledgeMajorArticleArrSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"knowledgeMajorArticleType"] ;
        knowledgeCrossCourseArrSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"knowledgeCrossCourseType"] ;
        knowledgeCrossArticleArrSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"knowledgeCrossArticleType"] ;
        skillMajorSkillArrSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"majorSkillType"] ;
        skillWebArrSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"skillWebType"] ;
        skillStrategyArrSet = [db executeQuery:@"SELECT * FROM article where type = ? order by time desc",@"skillStrategyType"] ;
    }] ;
//        [User sharedUser].major.majorName = [majorSet stringForColumn:@"majorName"] ;
        [User sharedUser].major.majorInfo.definition = [majorSet stringForColumn:@"definition"] ;
        [User sharedUser].major.majorInfo.direction = [majorSet stringForColumn:@"direction"] ;
        [User sharedUser].major.majorInfo.knowledge = [majorSet stringForColumn:@"knowledge"] ;
        [User sharedUser].major.majorInfo.skill = [majorSet stringForColumn:@"skill"] ;
        [User sharedUser].major.majorInfo.subject = [majorSet stringForColumn:@"subject"] ;
        //userInfo
        [User sharedUser].userName = [userSet stringForColumn:@"userName"] ;
        [User sharedUser].password = [userSet stringForColumn:@"password"] ;
        [User sharedUser].ID = [userSet intForColumn:@"id"] ;
        [User sharedUser].major.ID = [User sharedUser].ID ;
        //employment -> companyInfo & chanceArr
        while([companySet next]){
            Company * company = [[Company alloc] init] ;
            company.ID = [User sharedUser].ID ;
            company.companyID = [companySet intForColumn:@"companyid"] ;
            company.companyName = [companySet stringForColumn:@"companyName"] ;
            company.companyInfo = [companySet stringForColumn:@"companyInfo"] ;
            
            [[User sharedUser].major.employment.companyArr addObject:company] ;
        }
        for(Company * company in [User sharedUser].major.employment.companyArr){
            int i = 0 ;
            //company -> chanceArr
            while ([chanceSet next]) {
                Chance * chance = [[Chance alloc] init] ;
                chance.content = [chanceSet stringForColumn:@"content"] ;
                chance.time = [chanceSet stringForColumn:@"time"] ;
                if(company.companyID == [chanceSet intForColumn:@"companyid"]){
                                        [((Company *)[User sharedUser].major.employment.companyArr[i]).chanceArr addObject:chance] ;
                }
            }
            i++ ;
        }
        //employment -> newsArr
        while ([articleSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [articleSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[articleSet dataForColumn:@"image"]] ;
            article.content = [articleSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.employment.newsArr addObject:article] ;
        }
        //employment -> webArr
        while ([webArticleSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [webArticleSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[webArticleSet dataForColumn:@"image"]] ;
            article.content = [webArticleSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.employment.webArr addObject:article] ;
        }
        //knowledge -> courseArr(Major
        while ([knowledgeMajorCourseArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [knowledgeMajorCourseArrSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[knowledgeMajorCourseArrSet dataForColumn:@"image"]] ;
            article.content = [knowledgeMajorCourseArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.knowledge.majorCourseArr addObject:article] ;
        }

        //knowledge -> articleArr(Major
        while ([knowledgeMajorArticleArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [knowledgeMajorArticleArrSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[knowledgeMajorArticleArrSet dataForColumn:@"image"]] ;
            article.content = [knowledgeMajorArticleArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.knowledge.majorArticleArr addObject:article] ;
        }
        //knowledge -> courseArr(Cross
        while ([knowledgeCrossCourseArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [knowledgeCrossCourseArrSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[knowledgeCrossCourseArrSet dataForColumn:@"image"]] ;
            article.content = [knowledgeCrossCourseArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.knowledge.crossCourseArr addObject:article] ;
        }
        //knowledge -> articleArr(Cross
        while ([knowledgeCrossArticleArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [knowledgeCrossArticleArrSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[knowledgeCrossArticleArrSet dataForColumn:@"image"]] ;
            article.content = [knowledgeCrossArticleArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.knowledge.crossArticleArr addObject:article] ;
        }
        
        //skill -> majorSkill
        while ([skillMajorSkillArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [skillMajorSkillArrSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[skillMajorSkillArrSet dataForColumn:@"image"]] ;
            article.content = [skillMajorSkillArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.skill.majorSkillArr addObject:article] ;
        }
        //skill -> webArr（ruanjian
        while ([skillWebArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [skillWebArrSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[skillWebArrSet dataForColumn:@"image"]] ;
            article.content = [skillWebArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.skill.webArr addObject:article] ;
        }
        //skill -> strategyArr
        while ([skillStrategyArrSet next]) {
            Article * article = [[Article alloc] init] ;
            article.time = [skillStrategyArrSet stringForColumn:@"time"] ;
            article.img = [UIImage imageWithData:[skillStrategyArrSet dataForColumn:@"image"]] ;
            article.content = [skillStrategyArrSet stringForColumn:@"content"] ;
            article.ID = [User sharedUser].ID ;
            [[User sharedUser].major.skill.strategyArr addObject:article] ;
        }
}

- (void)addEmployment:(Company *)company
    andEmploymentNews:(Article *)newsArticle
     andEmploymentWeb:(Article *)webArticle
andKnowledgeMajorCourse:(Article *)courseMajorArticle             //专业 网课
andKnowledgeMajorArticle:(Article *)knowledgeMajorArticle        //专业 文章
andKnowledgeCrossCourse:(Article *)courseCrossArticle           //交叉 网课
andKnowledgeCrossArticle:(Article *)knowledgeCrossArticle         //交叉 文章
   andSkillMajorSkill:(Article *)majorSkillArticle
          andSkillWeb:(Article *)skillWebArticle
     andSkillStrategy:(Article *)strategyArticle {
    
    [[self getQueue] inDatabase:^(FMDatabase * _Nonnull db) {
        [db executeUpdate:@"INSERT INTO companyInfo(companyid,companyName,companyInfo)VALUES(?,?,?)",@(company.companyID),company.companyName,company.companyInfo] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"employmentNewsType",newsArticle.content,newsArticle.time,UIImageJPEGRepresentation(newsArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"employmentWebType",webArticle.content,webArticle.time,UIImageJPEGRepresentation(webArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"knowledgeMajorCourseType",courseMajorArticle.content,courseMajorArticle.time,UIImageJPEGRepresentation(courseMajorArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"knowledgeMajorArticleType",knowledgeMajorArticle.content,knowledgeMajorArticle.time,UIImageJPEGRepresentation(knowledgeMajorArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"knowledgeCrossCourseType",courseCrossArticle.content,courseCrossArticle.time,UIImageJPEGRepresentation(courseCrossArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"knowledgeCrossArticleType",knowledgeCrossArticle.content,knowledgeCrossArticle.time,UIImageJPEGRepresentation(knowledgeCrossArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"majorSkillType",majorSkillArticle.content,majorSkillArticle.time,UIImageJPEGRepresentation(majorSkillArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"skillWebType",skillWebArticle.content,skillWebArticle.time,UIImageJPEGRepresentation(skillWebArticle.img, 1)] ;
        [db executeUpdate:@"INSERT INTO article(id,type,content,time,image)VALUES(?,?,?,?,?)",@([User sharedUser].ID),@"skillStrategyType",strategyArticle.content,strategyArticle.time,UIImageJPEGRepresentation(strategyArticle.img, 1)] ;
    }] ;
}


@end

