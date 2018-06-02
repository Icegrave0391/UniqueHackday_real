//
//  HeaderCell.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(16, 30, 200, 24)];
        self.detail = [[UILabel alloc] initWithFrame:CGRectMake(16, 56, 200, 16)];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.detail];
        _title.font = [UIFont systemFontOfSize:24];
        _detail.font = [UIFont systemFontOfSize:16];
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
