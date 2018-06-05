//
//  Tab1.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "Tab1.h"

@implementation Tab1

- (instancetype) initWithFrame:(CGRect)frame {
    self.index = 0;
    self = [super initWithFrame:frame];
    self.frame = CGRectMake(2, 0, [[UIScreen mainScreen] bounds].size.width-4, 39);
    _imgView = [[UIImageView alloc] initWithFrame:self.frame];
    _imgView.image = [UIImage imageNamed:@"tab1"];
    [self addSubview:_imgView];
    _imgView.userInteractionEnabled = YES;
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _imgView.frame.size.width/2, 39)];
    btn1.tag = 1000;
    UIButton *btn2 =[[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width, 39)];
    btn2.tag = 1001;
    for (UIButton *btn in @[btn1, btn2]) {
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
    // Do any additional setup after loading the view.
}

- (void)didClickBtn:(UIButton *)btn {
    if(btn.tag == 1000) {
        self.index = 0;
        _imgView.image = [UIImage imageNamed:@"tab1"];
        NSLog(@"click1");
    } else {
        self.index = 1;
        _imgView.image = [UIImage imageNamed:@"tab2"];
        NSLog(@"click2");
    }
//    [self.delegate didClickBtn];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update" object:nil] ;
}


@end
