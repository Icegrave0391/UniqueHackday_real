//
//  Company.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "Company.h"

@implementation Company
-(NSMutableArray *)chanceArr{
    if(!_chanceArr){
        _chanceArr = [[NSMutableArray alloc] init] ;
    }
    return _chanceArr ;
}
@end
