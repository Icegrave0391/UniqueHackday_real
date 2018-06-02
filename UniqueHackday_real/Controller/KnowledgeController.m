//
//  KnowledgeController.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "KnowledgeController.h"
#import "LoginController.h"
#import "HorizontalCell.h"
#import "HeaderCell.h"
#import "ArticleCell.h"

@interface KnowledgeController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation KnowledgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginController *loginCtrl = [[LoginController alloc] init];
    UINavigationController *loginNavi = [[UINavigationController alloc] initWithRootViewController:loginCtrl];
    
//    [self presentViewController:loginNavi animated:YES completion:nil];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
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

#pragma mark - datasource  delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.row == 1) return 150;
    return 90;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HeaderCell *cell = [[HeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"header"];
        cell.title.text = @"精品网课";
        cell.detail.text = @"学习，不止于课堂";
        return cell;
    }
    else if (indexPath.row == 1) {
        HorizontalCell *cell = [[HorizontalCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hori"];
        return cell;
    }
    else if (indexPath.row == 2) {
        HeaderCell *cell = [[HeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"header"];
        cell.title.text = @"优质文章";
        cell.detail.text = @"来自行业大佬的用心分享";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
