//
//  AppDelegate.m
//  TabBarViewControllerSimpleUse
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建 window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 初始化 tabbarController
    UITabBarController* tabbarController = [[UITabBarController alloc] init];
    
    // 创建子控制器
    UIViewController* v1 = [[UIViewController alloc] init];
    UIViewController* v2 = [[UIViewController alloc] init];
    UIViewController* v3 = [[UIViewController alloc] init];
    
    // 设置背景颜色
    v1.view.backgroundColor = [UIColor redColor];
    v2.view.backgroundColor = [UIColor orangeColor];
    v3.view.backgroundColor = [UIColor blueColor];
    
    // 设置标题
    v1.tabBarItem.title = @"联系人";
    v2.tabBarItem.title = @"消息";
    v3.tabBarItem.title = @"设置";
    
    // 设置图片
    v1.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    v2.tabBarItem.image = [UIImage imageNamed:@"tab_me_nor"];
    v3.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
    
    // 设置提醒内容
    v1.tabBarItem.badgeValue = @"德玛西亚";
    
    // 添加子控制器
    [tabbarController addChildViewController:v1];
    [tabbarController addChildViewController:v2];
    [tabbarController addChildViewController:v3];
    
    // 设置 window 的根控制器
    self.window.rootViewController = tabbarController;
    
    // 显示
    [self.window makeKeyAndVisible];
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
