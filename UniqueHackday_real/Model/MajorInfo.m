//
//  MajorInfo.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "MajorInfo.h"

@implementation MajorInfo

-(NSMutableArray *)relatedArr{
    if(!_relatedArr){
        _relatedArr = [[NSMutableArray alloc] init] ;
    }
    return _relatedArr ;
}

@end
