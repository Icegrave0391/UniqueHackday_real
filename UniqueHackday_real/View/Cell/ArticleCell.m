//
//  ArticleCell.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "ArticleCell.h"

@implementation ArticleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1)];
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 103, [[UIScreen mainScreen] bounds].size.width, 1)];
        [self.contentView addSubview:line1];
        [self.contentView addSubview:line2];
        line1.backgroundColor = [UIColor colorWithRed:0.35 green:0.40 blue:0.45 alpha:1.00];
        line2.backgroundColor = [UIColor colorWithRed:0.35 green:0.40 blue:0.45 alpha:1.00];
        
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 270, 14)];
        self.detail = [[UILabel alloc] initWithFrame:CGRectMake(10, 24, 270, 40)];
        self.info = [[UILabel alloc] initWithFrame:CGRectMake(10, 72, 138, 14)];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_detail];
        [self.contentView addSubview:_info];
        _title.font = [UIFont systemFontOfSize:14];
        _detail.font = [UIFont systemFontOfSize:12];
        _info.font = [UIFont systemFontOfSize:10];
        _title.textColor = [UIColor colorWithRed:0.40 green:0.40 blue:0.40 alpha:1.00];
        _detail.textColor = [UIColor colorWithRed:0.40 green:0.40 blue:0.40 alpha:1.00];
        _info.textColor = [UIColor colorWithRed:0.56 green:0.71 blue:0.85 alpha:1.00];
        
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(290, 11, 73, 76)];
        [self.contentView addSubview:self.imgView];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
