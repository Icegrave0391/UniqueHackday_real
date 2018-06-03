//
//  MeCellTableViewCell.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "MeCellTableViewCell.h"

@implementation MeCellTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(30, 18, 160, 25)];
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(293, 21, 22, 22)];
        self.title.textColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00];
        self.title.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_imgView];
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
