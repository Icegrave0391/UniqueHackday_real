//
//  TopView.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 64);
        self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(16, 30, 343, 34)];
        [self addSubview:_searchField];
        _searchField.layer.cornerRadius = 4;
        self.searchField.layer.borderWidth = 1;
        self.searchField.layer.borderColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.59 alpha:1.00].CGColor;
        self.searchField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
        self.searchField.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
