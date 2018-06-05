//
//  Major.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "Major.h"

@implementation Major

- (Employment *)employment {
    if(!_employment) {
        _employment = [[Employment alloc] init];
    }
    return _employment;
}

- (Knowledge *)knowledge{
    if(!_knowledge){
        _knowledge = [[Knowledge alloc] init] ;
    }
    return _knowledge ;
}
-(Skill *)skill{
    if(!_skill){
        _skill = [[Skill alloc] init] ;
    }
    return _skill ;
}
@end

