//
//  SkillController.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "SkillController.h"
#import "TopView.h"
#import "HeaderCell.h"
#import "Tab2.h"
#import "ArticleCell.h"
#import "UIResponder+FirstResponder.h"

@interface SkillController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SkillController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TopView *topView = [[TopView alloc] init];
    [self.view addSubview:topView];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)]];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 68, self.view.frame.size.width, self.view.frame.size.height-48) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        Tab2 *cell = [[Tab2 alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hori"];
        return cell;
    }
    else if (indexPath.row == 1) {
        static NSString *ID = @"article";
        Tab2 *article = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!article) {
            article = [[Tab2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return article;
    }
    else if (indexPath.row == 2) {
        static NSString *ID = @"article";
        Tab2 *article = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!article) {
            article = [[Tab2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return article;
    }
    else if (indexPath.row == 3) {
        Tab2 *cell = [[Tab2 alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hori"];
        return cell;
    }
    else {
        static NSString *ID = @"article";
        Tab2 *article = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!article) {
            article = [[Tab2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return article;
    }
    
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
