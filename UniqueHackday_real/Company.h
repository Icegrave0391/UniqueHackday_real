//
//  Company.h
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chance.h"
@interface Company : NSObject

@property(nonatomic, strong)NSMutableArray * chanceArr ; //Chance
@property(nonatomic, strong)NSString * companyInfo ;

@property(nonatomic, strong)NSString * companyName ;

@property(nonatomic, assign)NSInteger companyID ;
@end

