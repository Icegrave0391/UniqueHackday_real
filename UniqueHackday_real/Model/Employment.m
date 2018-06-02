//
//  Employment.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "Employment.h"

@implementation Employment

-(NSMutableArray *)companyArr{
    if(!_companyArr){
        _companyArr = [[NSMutableArray alloc] init] ;
    }
    return _companyArr ;
}
-(NSMutableArray *)newsArr{
    if(!_newsArr){
        _newsArr = [[NSMutableArray alloc] init] ;
    }
    return _newsArr ;
}
-(NSMutableArray *)webArr{
    if(!_webArr){
        _webArr = [[NSMutableArray alloc] init] ;
    }
    return  _webArr ;
}
@end

