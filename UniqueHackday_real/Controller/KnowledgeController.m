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
#import "TopView.h"
#import "Tab1.h"
#import "User.h"
#import "UIResponder+FirstResponder.h"
#import "Article.h"
#import "FakeData.h"
@interface KnowledgeController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) Tab1 *tab;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation KnowledgeController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"recent"];
    if(!username) {
        LoginController *loginCtrl = [[LoginController alloc] init];
        UINavigationController *loginNavi = [[UINavigationController alloc] initWithRootViewController:loginCtrl];
        [self presentViewController:loginNavi animated:YES completion:nil];
    }
    FakeData * fake = [[FakeData alloc] init] ;
    [fake getInfo] ;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableView) name:@"update" object:nil] ;

    self.view.backgroundColor = [UIColor whiteColor] ;
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)]];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    _tab = [[Tab1 alloc] initWithFrame:CGRectMake(2, 0, [[UIScreen mainScreen] bounds].size.width-4, 39)];
    tableView.tableHeaderView = _tab;
    tableView.delegate = self;
    
//    [self.view addSubview:_tab];
    TopView *topView = [[TopView alloc] init];
    [self.view addSubview:topView];
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
    if(_tab.index == 0) {
        return 3+[User sharedUser].major.knowledge.majorArticleArr.count;
    } else {
        return 3+[User sharedUser].major.knowledge.crossArticleArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.row == 1) return 150;
    if(indexPath.row > 2) return 116;
    return 90;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(_tab.index == 0) {
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
            article.title.text = ((Article *)[User sharedUser].major.knowledge.majorArticleArr[indexPath.row-3]).time;
            article.detail.text =((Article *)[User sharedUser].major.knowledge.majorArticleArr[indexPath.row-3]).content ;
            article.imgView.image = ((Article *)[User sharedUser].major.knowledge.majorArticleArr[indexPath.row-3]).img ;
            return article;
        }
    } else {
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
            article.title.text = ((Article *)[User sharedUser].major.knowledge.crossArticleArr[indexPath.row-3]).time;
            article.detail.text =((Article *)[User sharedUser].major.knowledge.crossArticleArr[indexPath.row-3]).content ;
            article.imgView.image = ((Article *)[User sharedUser].major.knowledge.crossArticleArr[indexPath.row-3]).img ;
            return article;
        }
    }
    

}
- (void)didClickBtn {
    [_tableView reloadData];
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
-(void)updateTableView{
    [_tableView reloadData] ;
}
-(void )dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self] ;
}

@end
