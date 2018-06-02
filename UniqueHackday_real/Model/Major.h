//
//  Major.h
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MajorInfo.h"
#import "Employment.h"
#import "Knowledge.h"
#import "Skill.h"
@interface Major : NSObject
@property(nonatomic, assign)NSInteger ID ;
@property(nonatomic, strong)NSString * majorName ;
@property(nonatomic, strong)MajorInfo * majorInfo ;
@property(nonatomic, strong)Employment * employment ;
@property(nonatomic, strong)Knowledge * knowledge ;
@property(nonatomic, strong)Skill * skill ;

@end

