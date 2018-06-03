
//
//  NetworkTool.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "NetworkTool.h"
#import <AFNetworking.h>

static NetworkTool *tool;

@implementation NetworkTool
+ (instancetype)sharedNetTool {
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        tool = [[NetworkTool alloc] init];
    });
    return tool;
}



@end
