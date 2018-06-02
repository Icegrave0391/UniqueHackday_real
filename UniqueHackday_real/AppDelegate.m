//
//  AppDelegate.m
//  UniqueHackday_real
//
//  Created by 张储祺 on 2018/6/2.
//  Copyright © 2018年 UniqueHackday2018. All rights reserved.
//

#import "AppDelegate.h"
#import "KnowledgeController.h"
#import "SkillController.h"
#import "EmploymentController.h"
#import "MeController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    UITabBarController *tabCtrl = [[UITabBarController alloc] init];
    self.window.rootViewController = tabCtrl;
    
    
    
    KnowledgeController *knowledgeCtrl = [[KnowledgeController alloc] init];
    SkillController *skillCtrl = [[SkillController alloc] init];
    EmploymentController *employmentCtrl = [[EmploymentController alloc] init];
    MeController *meCtrl = [[MeController alloc] init];
    
    
    UINavigationController *knowledgeNavi = [[UINavigationController alloc] initWithRootViewController:knowledgeCtrl];
    UINavigationController *skillNavi = [[UINavigationController alloc] initWithRootViewController:skillCtrl];
    UINavigationController *employmentNavi = [[UINavigationController alloc] initWithRootViewController:employmentCtrl];
    UINavigationController *meNavi = [[UINavigationController alloc] initWithRootViewController:meCtrl];
    tabCtrl.viewControllers = @[knowledgeNavi, skillNavi, employmentNavi, meNavi];
    
    
    knowledgeNavi.tabBarItem.title = @"知识";
    knowledgeNavi.tabBarItem.image = [UIImage imageNamed:@"1"];
    skillNavi.tabBarItem.title = @"技能";
    skillNavi.tabBarItem.image = [UIImage imageNamed:@"2"];
    employmentNavi.tabBarItem.title = @"行情";
    employmentNavi.tabBarItem.image = [UIImage imageNamed:@"3"];
    meNavi.tabBarItem.title = @"我的";
    meNavi.tabBarItem.image = [UIImage imageNamed:@"4"];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.49 green:0.51 blue:0.81 alpha:1.00]];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
