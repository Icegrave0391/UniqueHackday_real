//
//  LoginController.m
//  UniqueHackday_real
//
//  Created by Gary Lee on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "LoginController.h"
#import "UIResponder+FirstResponder.h"
#import "RegisterController.h"
#import "DataBase.h"
#import "Major.h"
#import "User.h"
#import "Chance.h"
#import "Company.h"
#import "Article.h"
#import "CompleteController.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSNumber * inte = [NSNumber numberWithInteger:1] ;
//
//    Company * company =[[Company alloc] init] ;
//    company.companyID = [inte integerValue];
//    company.ID = [inte integerValue] ;
//    company.companyName = @"companyname" ;
//    company.companyInfo = @"info" ;
//    Chance * chance = [[Chance alloc] init] ;
//    chance.content = @"chance content" ;
//    [company.chanceArr addObject:chance] ;
//
//    Article * employNews = [[Article alloc] init] ;
//    employNews.content = @"employnews" ;
//    employNews.ID = [inte integerValue] ;
//    Article * employWeb = [[Article alloc] init] ;
//    employWeb.content = @"employWeb" ;
//    employWeb.ID = [inte integerValue] ;
//    Article * knowledgeMajorCourse = [[Article alloc] init] ;
//    knowledgeMajorCourse.content = @"majorCourse" ;
//    knowledgeMajorCourse.ID =[inte integerValue] ;
//    Article * MajorArticle = [[Article alloc] init] ;
//    MajorArticle.content = @"majorArticle" ;
//    MajorArticle.ID =[inte integerValue] ;
//    Article * crossCourse = [[Article alloc] init] ;
//    crossCourse.content = @"crossCourse" ;
//    crossCourse.ID = [inte integerValue] ;
//    Article * knowledgeArticle = [[Article alloc] init] ;
//    knowledgeArticle.content = @"knowledgeContent" ;
//    knowledgeArticle.ID = [inte integerValue];
//    Article * skillArticle = [[Article alloc] init] ;
//    skillArticle.content = @"skillArticle" ;
//    skillArticle.ID = [inte integerValue];
//    Article * skillWeb = [[Article alloc] init] ;
//    skillWeb.content = @"skillWeb" ;
//    skillWeb.ID = [inte integerValue];
//    Article * skillStrategy = [[Article alloc] init] ;
//    skillStrategy.content = @"skillStre" ;
//    skillStrategy.ID = [inte integerValue] ;
//    [User sharedUser].ID = [inte integerValue];
//
//    [[DataBase sharedDB] addEmployment:company andEmploymentNews:employNews andEmploymentWeb:employWeb andKnowledgeMajorCourse:knowledgeMajorCourse andKnowledgeMajorArticle:MajorArticle andKnowledgeCrossCourse:crossCourse andKnowledgeCrossArticle:knowledgeArticle andSkillMajorSkill:skillArticle andSkillWeb:skillWeb andSkillStrategy:skillStrategy] ;
//    [[DataBase sharedDB] getUserAllInfo] ;
//
//    NSLog(@"%@",[User sharedUser]) ;
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)]];
//    UIImageView *back = [[UIImageView alloc] initWithFrame:self.view.frame];
//    back.userInteractionEnabled = YES;
//    [self.view addSubview:back];
//    back.image = [UIImage imageNamed:@"LoginBack"];
    [self.view setBackgroundColor:[UIColor whiteColor]] ;
    
    //icon
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(136, 104, 104, 138)];
    [self.view addSubview:icon];
    icon.image = [UIImage imageNamed:@"avator"];
    
    //Lable
    UILabel *nameLable = [[UILabel alloc] initWithFrame:CGRectMake(48, 274, 62, 22)];
    nameLable.text = @"用户名:";
    UILabel *passwordLable = [[UILabel alloc] initWithFrame:CGRectMake(48, 330, 47, 22)];
    passwordLable.text = @"密码:";
    for (UILabel *lable in @[nameLable, passwordLable]) {
        lable.textColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00] ;
        lable.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:lable];
    }
    
    //横线
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(48, 305, 279, 1)];
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(48, 361, 279, 1)];
    for (UIView *line in @[line1, line2]) {
        line.backgroundColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00] ;
        [self.view addSubview:line];
    }
    
    //输入框
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(110, 274, 217, 32)];
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(110, 330, 217, 32)];
    for (UITextField *field in @[self.usernameField, self.passwordField]) {
        field.textColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00];
        [self.view addSubview:field];
        field.font = [UIFont systemFontOfSize:16];
        field.keyboardType = UIKeyboardTypeAlphabet;
    }
    //小眼睛
    self.eyeView = [[UIImageView alloc] initWithFrame:CGRectMake(289, 339, 22, 17)] ;
    self.eyeView.image = [UIImage imageNamed:@"eye"] ;
    [self.view addSubview:self.eyeView] ;
    UIButton * eyeButton = [[UIButton alloc] initWithFrame:CGRectMake(289, 339, 22, 17)] ;
    eyeButton.backgroundColor = [UIColor clearColor] ;
    [eyeButton addTarget:self action:@selector(switchPassword) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:eyeButton] ;
    
    //忘记密码
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(259, 370, 68, 20)] ;
    [label setText:@"忘记密码?"] ;
    label.font = [UIFont systemFontOfSize:14] ;
    [self.view addSubview:label] ;
    
//    //按钮
//    UIView *loginBtn = [[UIView alloc] initWithFrame:CGRectMake(206, 452, 129, 40)];
//    UIView *regBtn = [[UIView alloc] initWithFrame:CGRectMake(48, 452, 129, 40)];
//    loginBtn.backgroundColor = [UIColor whiteColor];
//    for (UIView *Btn in @[loginBtn, regBtn]) {
//        Btn.layer.cornerRadius = 4;
//        Btn.layer.borderColor = [UIColor whiteColor].CGColor;
//        Btn.layer.borderWidth = 1;
//        [self.view addSubview:Btn];
//    }
    
//    UILabel *loginLable = [[UILabel alloc] init];
//    UILabel *regLable = [[UILabel alloc] init];
//    for (UILabel *lable in @[loginLable, regLable]) {
//        lable.frame = CGRectMake(49, 9, 34, 22);
//        lable.font = [UIFont systemFontOfSize:16];
//    }
//    [loginBtn addSubview:loginLable];
//    [regBtn addSubview:regLable];
//    loginLable.text = @"登录";
//    regLable.text = @"注册";
//    [loginBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickLogin)]];
//    [regBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickRegister)]];
    //按钮
//    UIImageView * registerView = [[UIImageView alloc] initWithFrame:CGRectMake(48, 410, 129, 40)] ;
//    registerView.image = [UIImage imageNamed:@"Register"] ;
//    [self.view addSubview:registerView] ;
//    UIImageView * loginView = [[UIImageView alloc] initWithFrame:CGRectMake(206, 410, 129, 40)] ;
//    loginView.image = [UIImage imageNamed:@"Login"] ;
//    [self.view addSubview:loginView] ;
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(48, 410, 287, 40)] ;
    imgView.image = [UIImage imageNamed:@"test"] ;
    [self.view addSubview:imgView] ;
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(206, 410, 129, 40)] ;
    [loginButton addTarget:self action:@selector(didClickLogin) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:loginButton] ;
    //底部第三方登录
    UIImageView *bottomLogin = [[UIImageView alloc] initWithFrame:CGRectMake(48, 540, 280, 62)];
    bottomLogin.image = [UIImage imageNamed:@"Other"];
    [self.view addSubview:bottomLogin];
}

- (void)didClickLogin {
    NSLog(@"click") ;
    CompleteController * tvc = [[CompleteController alloc] init] ;
    [self.navigationController pushViewController:tvc animated:YES] ;
}

//- (void)didClickRegister {
//    RegisterController *regCtrl = [[RegisterController alloc] init];
//    [self.navigationController pushViewController:regCtrl animated:YES];
//}

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
//点击小眼睛
-(void)switchPassword{
    self.eyeView.image = [UIImage imageNamed:@"eye1"] ;
    self.passwordField.secureTextEntry = !self.passwordField.secureTextEntry ;
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
