//
//  DataBase.h
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Major.h"
#include "MajorInfo.h"
#import "Employment.h"
#import "Knowledge.h"
#import "Skill.h"
#import "Chance.h"
#import "Article.h"
#import "Company.h"
#import "User.h"

@interface DataBase : NSObject

+ (instancetype)sharedDB;

- (void)getUserAllInfo ;

- (void)addEmployment:(Company *)company
    andEmploymentNews:(Article *)newsArticle
     andEmploymentWeb:(Article *)webArticle
      andKnowledgeWeb:(Article *)knoeledgeWebArticle
andKnowledgeMajorCourse:(Article *)courseMajorArticle
andKnowledgeMajorArticle:(Article *)knowledgeMajorArticle
andKnowledgeCrossCourse:(Article *)courseCrossArticle
andKnowledgeCrossArticle:(Article *)knowledgeCrossArticle
   andSkillMajorSkill:(Article *)majorSkillArticle
          andSkillWeb:(Article *)skillWebArticle
     andSkillStrategy:(Article *)strategyArticle ;
@end

