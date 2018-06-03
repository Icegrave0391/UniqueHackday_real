//
//  CompleteController.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/3.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "CompleteController.h"
#import "UIResponder+FirstResponder.h"
#import "KnowledgeController.h"
@interface CompleteController ()

@end

@implementation CompleteController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]] ;
    [self.navigationController setNavigationBarHidden:YES animated:NO] ;
    // Do any additional setup after loading the view.
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)]];
    
    UIImageView * titleView = [[UIImageView alloc] initWithFrame:CGRectMake(17, 67, 194, 70)] ;
    titleView.image = [UIImage imageNamed:@"title"] ;
    [self.view addSubview:titleView] ;
    UIImageView * footView = [[UIImageView alloc] initWithFrame:CGRectMake(141, 432, 220, 24)] ;
    footView.image = [UIImage imageNamed:@"foot"] ;
    [self.view addSubview:footView] ;
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:CGRectMake(128, 505, 107, 137)] ;
    logoView.image = [UIImage imageNamed:@"logo"] ;
    [self.view addSubview:logoView] ;
    
    UIImageView * nameView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 217, 281, 29)] ;
    nameView.image = [UIImage imageNamed:@"name"] ;
    nameView.userInteractionEnabled = YES ;
    [self.view addSubview:nameView] ;
    UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(63, 212, 233, 29)] ;
    nameField.keyboardType = UIKeyboardTypeAlphabet;
    nameField.textColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00]; ;
    nameField.font = [UIFont systemFontOfSize:16] ;
    [self.view addSubview:nameField] ;
    
    UIImageView * majorView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 277, 281, 29)] ;
    majorView.image = [UIImage imageNamed:@"major"] ;
    [self.view addSubview:majorView] ;
    UITextField * majorField = [[UITextField alloc] initWithFrame:CGRectMake(63, 270, 281, 29)] ;
    majorField.keyboardType = UIKeyboardTypeAlphabet;
    majorField.textColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00]; ;
    majorField.font = [UIFont systemFontOfSize:16] ;
    [self.view addSubview:majorField] ;
    
    UIImageView * schoolView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 337, 281, 29)] ;
    schoolView.image = [UIImage imageNamed:@"school"] ;
    [self.view addSubview:schoolView] ;
    UITextField * schoolField = [[UITextField alloc] initWithFrame:CGRectMake(94, 331, 281, 29)] ;
    schoolField.keyboardType = UIKeyboardTypeAlphabet;
    schoolField.textColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:1.00]; ;
    schoolField.font = [UIFont systemFontOfSize:16] ;
    [self.view addSubview:schoolField] ;
    
    UIButton * seguebtn = [[UIButton alloc] initWithFrame:CGRectMake(128, 505, 107, 137)] ;
    [seguebtn setBackgroundColor:[UIColor clearColor]] ;
    [seguebtn addTarget:self action:@selector(pushNew) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:seguebtn] ;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated] ;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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

-(void)pushNew{
    KnowledgeController * tvc = [[KnowledgeController alloc] init] ;
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
