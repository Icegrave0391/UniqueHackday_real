//
//  MeController.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "MeController.h"
#import "MeCellTableViewCell.h"
#import "User.h"

@interface MeController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MeController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 135, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    
    UILabel *majorLable = [[UILabel alloc] initWithFrame:CGRectMake(16, 44, 180, 50)];
    majorLable.font = [UIFont systemFontOfSize:36];
    majorLable.text = [User sharedUser].major.majorName;
    UILabel *click = [[UILabel alloc] initWithFrame:CGRectMake(16, 94, 160, 25)];
    click.text = @"点击了解其他专业";
    click.textColor = [UIColor colorWithRed:0.49 green:0.49 blue:0.49 alpha:1.00];
    click.font = [UIFont systemFontOfSize:18];
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(282, 94, 37, 25)];
    name.font = [UIFont systemFontOfSize:18];
    name.text = [User sharedUser].userName;
    name.textColor = [UIColor colorWithRed:0.51 green:0.52 blue:0.82 alpha:1.00];
    
    for (UILabel *lable in @[majorLable, click, name]) {
        [self.view addSubview:lable];
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 61;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"id";
    MeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell)
        cell = [[MeCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    NSDictionary *dict = @{@0:@"收藏", @1:@"专业网站", @2:@"就业详情", @3:@"课堂学的有啥用", @4:@"获取帮助", @5:@"向我们反馈"};
    cell.title.text = dict[@(indexPath.row)];
    cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"me%ld", (long)indexPath.row+1]];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
