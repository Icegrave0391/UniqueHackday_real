//
//  Article.h
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Article : NSObject

@property(nonatomic, strong)NSString * content ;
@property(nonatomic, strong)UIImage * img ; //部分有 课程部分预览图
@property(nonatomic, strong)NSString * time ;
@property(nonatomic, assign)NSInteger ID ;

@end

