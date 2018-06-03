//
//  Tab2Item.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "Tab2Item.h"

@implementation Tab2Item
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        self.title = [[UILabel alloc] initWithFrame:CGRectMake(6, 66, 100, 14)];
        [self.contentView addSubview:self.title];
        self.title.font = [UIFont systemFontOfSize:14];
        self.title.textColor = [UIColor colorWithRed:0.49 green:0.51 blue:0.81 alpha:1.00];
        
        
    }
    return self;
}
@end
