//
//  FakeData.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "FakeData.h"

@implementation FakeData

-(NSMutableArray *)webCourseArr{
    if(!_webCourseArr){
        Article * a1 = [[Article alloc] init] ;
        a1.content = @"产品设计中的思考与实例";
        a1.time = @"设计思维" ;
        a1.ID = 1 ;
        a1.img = [UIImage imageNamed:@"img1"] ;
        Article * a2 = [[Article alloc] init] ;
        a2.content = @"产品研发前期重要的阶段" ;
        a2.time = @"用户调研" ;
        a2.ID = 1;
        a2.img = [UIImage imageNamed:@"img2"] ;
        Article * a3 = [[Article alloc] init] ;
        a3.content = @"产品设计中的交互原理和实例" ;
        a3.time = @"交互原理" ;
        a3.ID = 1 ;
        a3.img = [UIImage imageNamed:@"img3"] ;
        _webCourseArr = [NSMutableArray arrayWithArray:@[a1,a2,a3] ];
    }
    return _webCourseArr ;
}

-(NSMutableArray *)majorArticleArr{
    if(!_majorArticleArr){
        Article * a1 = [[Article alloc] init] ;
        a1.content = @"在交互设计日常项目中，常会遇到由于角色差异而产生的多全线模型设计" ;
        a1.time = @"UI中的设计:从概念到现实" ;
        a1.ID = 1 ;
        a1.img = [UIImage imageNamed:@"img4"] ;
        Article * a2 = [[Article alloc] init] ;
        a2.content = @"在交互设计作图时，经常会遇到表单做图很慢的情况" ;
        a2.time = @"设计沉思录:如何让高效完成表单输入" ;
        a2.ID = 1 ;
        a2.img = [UIImage imageNamed:@"img5"] ;
        Article * a3 = [[Article alloc] init] ;
        a3.content = @"在交互设计日常项目中，常会遇到由于角色差异而产生的多全线模型设计" ;
        a3.time = @"UI中的设计:从概念到现实" ;
        a3.ID = 1 ;
        a3.img = [UIImage imageNamed:@"img6"] ;
        _majorArticleArr = [NSMutableArray arrayWithArray:@[a1,a2,a3]] ;
    }
    return _majorArticleArr ;
}

-(NSMutableArray *)softSkillArr{
    if (!_softSkillArr) {
        Article * a1 = [[Article alloc] init] ;
        a1.content = @"rhino建模基础篇，曲线与曲面" ;
        a1.time = @"Rhino" ;
        a1.ID = 1 ;
        a1.img = [UIImage imageNamed:@"img7"] ;
        Article * a2 = [[Article alloc] init] ;
        a2.content = @"rhino建模进阶篇，双轨归掠实战" ;
        a2.time = @"Rhino" ;
        a2.ID = 1 ;
        a2.img = [UIImage imageNamed:@"img8"] ;
        Article * a3 = [[Article alloc] init] ;
        a3.content = @"rhino建模进阶篇，吹风机的建模" ;
        a3.time = @"Rhino" ;
        a3.ID = 1 ;
        a3.img = [UIImage imageNamed:@"img9"] ;
        _softSkillArr = [NSMutableArray arrayWithArray:@[a1,a2,a3]] ;
    }
    return _softSkillArr ;
}

-(NSMutableArray *)professSkillArr{
    if(!_professSkillArr){
        Article * a1 = [[Article alloc] init] ;
        a1.content = @"摄影方法：如何调光" ;
        a1.time = @"摄影" ;
        a1.ID = 1 ;
        a1.img = [UIImage imageNamed:@"img10"] ;
        Article * a2 = [[Article alloc] init] ;
        a2.content = @"马克笔进阶：汽车快速表达" ;
        a2.time = @"绘画" ;
        a2.ID = 1 ;
        a2.img = [UIImage imageNamed:@"img11"] ;
        Article * a3 = [[Article alloc] init] ;
        a3.content = @"色彩基础：补差与对比" ;
        a3.time = @"色彩" ;
        a3.ID = 1 ;
        a3.img = [UIImage imageNamed:@"img12"] ;
        _professSkillArr = [NSMutableArray arrayWithArray:@[a1,a2,a3]] ;
    }
    return _professSkillArr ;
}
-(NSMutableArray *)crossWebArr{
    if(!_crossWebArr){
        Article * a1 = [[Article alloc] init] ;
        a1.content = @"交叉1" ;
        a1.time = @"从数据表1" ;
        a1.ID = 1 ;
        a1.img = [UIImage imageNamed:@"img13"] ;
        Article * a2 = [[Article alloc] init] ;
        a2.content = @"交叉2" ;
        a2.time = @"从数据表2" ;
        a2.ID = 1 ;
        a2.img = [UIImage imageNamed:@"img14"] ;
        Article * a3 = [[Article alloc] init] ;
        a3.content = @"交叉3" ;
        a3.time = @"从数据表3" ;
        a3.ID = 1 ;
        a3.img = [UIImage imageNamed:@"img15"] ;
        _crossWebArr = [NSMutableArray arrayWithArray:@[a1,a2,a3]] ;
    }
    return _crossWebArr ;
}

-(NSMutableArray *)crossArticleArr{
    if(!_crossArticleArr){
        Article * a1 = [[Article alloc] init] ;
        a1.content = @"交叉文章1" ;
        a1.time = @"从数据表1生成" ;
        a1.ID = 1 ;
        a1.img = [UIImage imageNamed:@"img16"] ;
        Article * a2 = [[Article alloc] init] ;
        a2.content = @"交叉文章2" ;
        a2.time = @"从数据表2生成" ;
        a2.ID = 1 ;
         a2.img = [UIImage imageNamed:@"img16"] ;
        Article * a3 = [[Article alloc] init] ;
        a3.content = @"交叉文章3" ;
        a3.time = @"从数据表3生成" ;
        a3.ID = 1 ;
         a3.img = [UIImage imageNamed:@"img16"] ;
        _crossArticleArr = [NSMutableArray arrayWithArray:@[a1,a2,a3]] ;
    }
    return _crossArticleArr ;
}

-(NSMutableArray *)companyArr{
    if(!_companyArr){
        Company * a1 = [[Company alloc] init] ;
        a1.companyInfo = @"搜索端互联网公司" ;
        a1.companyName = @"百度" ;
        a1.ID = 1 ;
        a1.companyID = 1 ;
        Company * a2 = [[Company alloc] init] ;
        a2.companyInfo = @"淘宝、天猫等服务" ;
        a2.companyName = @"阿里巴巴" ;
        a2.ID = 1 ;
        a2.companyID = 1 ;
        Company * a3 = [[Company alloc] init] ;
        a3.companyInfo = @"互联网综合服务" ;
        a3.companyName = @"腾讯" ;
        a3.ID = 1 ;
        a3.companyID = 1 ;
        _companyArr = [NSMutableArray arrayWithArray:@[a1,a2,a3]] ;
    }
    return _companyArr ;
}

-(NSMutableArray *)newsArr{
    if(!_newsArr){
        Article * a1 = [[Article alloc] init] ;
        a1.content = @"在交互设计日常中，常会遇到由于角色差异而产生的多线程线性模型设计" ;
        a1.time = @"UI设计:从概念到现实" ;
        a1.ID = 1 ;
        Article * a2 = [[Article alloc] init] ;
        a2.content = @"一个页面上的元素。尤其是信息类为主的设计界面上。一定要有它出现的意义。" ;
        a2.time = @"迷你版技巧-短线" ;
        a2.ID = 1 ;
        Article * a3 = [[Article alloc] init] ;
        a3.content = @"色彩对比，肌理对比，前后对比，疏密对比，虚实对比，方向对比，聚散对比，八大对比方法一一点破" ;
        a3.time = @"对比技法常用知识点" ;
        a3.ID = 1 ;
        _crossArticleArr = [NSMutableArray arrayWithArray:@[a1,a2,a3]] ;
    }
    return _newsArr ;
}

-(void)createFakeData{
    for (int i = 0; i<=2; i++) {
        [[DataBase sharedDB] addEmployment:self.companyArr[i] andEmploymentNews:self.newsArr[i] andEmploymentWeb:nil andKnowledgeMajorCourse:self.webCourseArr[i] andKnowledgeMajorArticle:self.majorArticleArr[i] andKnowledgeCrossCourse:self.crossWebArr[i] andKnowledgeCrossArticle:self.crossArticleArr[i] andSkillMajorSkill:self.professSkillArr[i] andSkillWeb:self.softSkillArr[i] andSkillStrategy:nil] ;
    }
}
-(void)getInfo{
    [[DataBase sharedDB] getUserAllInfo] ;
}
@end
