//
//  Knowledge.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "Knowledge.h"

@implementation Knowledge
-(NSMutableArray *)majorCourseArr{
    if(!_majorCourseArr){
        _majorCourseArr = [[NSMutableArray alloc] init] ;
    }
    return _majorCourseArr ;
}
-(NSMutableArray *)majorArticleArr{
    if(!_majorArticleArr){
        _majorArticleArr = [[NSMutableArray alloc] init] ;
    }
    return _majorArticleArr ;
}
-(NSMutableArray *)crossCourseArr{
    if(!_crossCourseArr){
        _crossCourseArr = [[NSMutableArray alloc] init] ;
    }
    return _crossCourseArr ;
}
-(NSMutableArray *)crossArticleArr{
    if(!_crossArticleArr){
        _crossArticleArr = [[NSMutableArray alloc] init] ;
    }
    return _crossArticleArr ;
}
@end

