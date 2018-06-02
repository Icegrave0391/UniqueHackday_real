//
//  User.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//


#import "User.h"

@implementation User

static User *user ;

+ (instancetype)sharedUser {
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        user = [[User alloc] init] ;
    });
    return user;
}

@end

