//
//  MajorInfo.h
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MajorInfo : NSObject
//发展方向
@property(nonatomic, strong)NSString * definition ;
@property(nonatomic, strong)NSString * direction ;
@property(nonatomic, strong)NSString * knowledge ;
@property(nonatomic, strong)NSString * skill ;
//相关专业
@property(nonatomic, strong)NSMutableArray * relatedArr ;
//基本信息
@property(nonatomic, strong)NSString * subject ;

@end

