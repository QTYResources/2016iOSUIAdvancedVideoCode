//
//  AppDelegate.m
//  SetNavigationBarContent
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "AppDelegate.h"
#import "HMRedViewController.h"
#import "HMGreenViewController.h"
#import "HMBlueViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 创建红色控制器交给导航控制器管理
    HMRedViewController *redVc = [[HMRedViewController alloc] init];
    
    // 2.设置 window 的根控制
    // > 创建导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:redVc];
    
    
    self.window.rootViewController = nav;
    
    
    // 3.将窗口设置为主窗口并且可见
    [self.window makeKeyAndVisible];
    
    return YES;
}

// 演示
- (void)test {
    UINavigationController *nav = [[UINavigationController alloc] init];
    self.window.rootViewController = nav;
    
    // 创建3个控制器交给导航控制器管理
    HMRedViewController *redVc = [[HMRedViewController alloc] init];
    HMGreenViewController *greenVc = [[HMGreenViewController alloc] init];
    HMBlueViewController *blueVc = [[HMBlueViewController alloc ] init];
    
    // push 进来
    [nav pushViewController:redVc animated:YES];
    [nav pushViewController:greenVc animated:YES];
    [nav pushViewController:blueVc animated:YES];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
