//
//  FakeData.h
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBase.h"
#import "User.h"
#import "Chance.h"
#import "Article.h"
#import "Company.h"

@interface FakeData : NSObject


//majorknowledge
@property(nonatomic, strong)NSMutableArray * webCourseArr ;     //网课
@property(nonatomic, strong)NSMutableArray * majorArticleArr ;  //文章
//crossknowledge
@property(nonatomic, strong)NSMutableArray * crossWebArr ;
@property(nonatomic, strong)NSMutableArray * crossArticleArr ;
//skill
@property(nonatomic, strong)NSMutableArray * softSkillArr ;     //软件
@property(nonatomic, strong)NSMutableArray * professSkillArr ;  //专业

//行情
@property(nonatomic , strong)NSMutableArray * companyArr ;  //公司
@property(nonatomic, strong)NSMutableArray * newsArr ;  //行业新闻

-(void)createFakeData ;
@end
