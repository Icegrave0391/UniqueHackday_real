//
//  CollectionCell.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame] ;
    if (self) {
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 61)];
        [self.contentView addSubview:self.imgView];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(6, 66, 100, 14)];
        [self.contentView addSubview:self.title];
        self.title.font = [UIFont systemFontOfSize:14];
        
        self.detail = [[UILabel alloc] initWithFrame:CGRectMake(6, 80, 100, 30)];
        [self.contentView addSubview:self.detail];
        self.detail.font = [UIFont systemFontOfSize:10];
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.5f;
        self.layer.shadowOffset = CGSizeMake(4, 4);
        self.layer.cornerRadius = 2;
    }
    return self;
}

@end
