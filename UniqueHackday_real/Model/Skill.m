//
//  Skill.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "Skill.h"

@implementation Skill
-(NSMutableArray *)majorSkillArr{
    if(!_majorSkillArr){
        _majorSkillArr = [[NSMutableArray alloc] init] ;
    }
    return _majorSkillArr ;
}
-(NSMutableArray *)webArr{
    if(!_webArr){
        _webArr = [[NSMutableArray alloc] init] ;
    }
    return _webArr ;
}
-(NSMutableArray *)strategyArr{
    if(_strategyArr){
        _strategyArr = [[NSMutableArray alloc] init] ;
    }
    return _strategyArr ;
}
@end


