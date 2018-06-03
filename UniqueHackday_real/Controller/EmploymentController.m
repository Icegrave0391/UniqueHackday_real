//
//  EmploymentController.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "EmploymentController.h"
#import "TopView.h"
#import "HorizontalCell.h"
#import "HeaderCell.h"
#import "UIResponder+FirstResponder.h"
#import "ArticleCell.h"

@interface EmploymentController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation EmploymentController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TopView *topView = [[TopView alloc] init];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)]];
    [self.view addSubview:topView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view.
}

#pragma mark - datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.row == 1|| indexPath.row == 3) return 150;
    if(indexPath.row > 4) return 116;
    return 90;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HeaderCell *cell = [[HeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"header"];
        cell.title.text = @"了解公司";
        cell.detail.text = @"将专业与社会接轨";
        return cell;
    }
    else if (indexPath.row == 1) {
        HorizontalCell *cell = [[HorizontalCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hori"];
        return cell;
    }
    if (indexPath.row == 2) {
        HeaderCell *cell = [[HeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"header"];
        cell.title.text = @"我要实习";
        cell.detail.text = @"提前一步进入社会";
        return cell;
    }
    else if (indexPath.row == 3) {
        HorizontalCell *cell = [[HorizontalCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hori"];
        return cell;
    }
    else if (indexPath.row == 4) {
        HeaderCell *cell = [[HeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"header"];
        cell.title.text = @"行业新闻";
        cell.detail.text = @"最新最热行业知识";
        return cell;
    }
    else {
        static NSString *ID = @"article";
        ArticleCell *article = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!article) {
            article = [[ArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return article;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//键盘收起
- (void)hideKeyboard {
    NSLog(@"tap gesture");
    id responder = [UIResponder currentFirstResponder];
    if([responder isKindOfClass:[UITextField class]] || [responder isKindOfClass:[UITextView class]]) {
        UIView *view = responder;
        [view resignFirstResponder];
    }
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
