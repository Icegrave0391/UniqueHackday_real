//
//  User.h
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Major.h"
@interface User : NSObject

@property(nonatomic, assign)NSInteger ID ;
@property(nonatomic, strong)Major * major ;
@property(nonatomic, strong)NSString * userName ;
@property(nonatomic, strong)NSString * password ;

+ (instancetype)sharedUser ;

@end

