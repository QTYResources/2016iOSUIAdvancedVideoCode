//
//  AppDelegate.m
//  NavigationControllerLifeCycle
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
/**
 导航控制器使用注意事项:
 1.创建控制器的同时指定它的根控制器
 2.显示下一个控制的时候,
 > 创建一个要 push 到的控制器
 > push的时候,需要获取到当前控制器的导航控制器才能进行 push 操作
 3.返回:
 > 返回上一个控制:      popViewControllerAnimated:
 > 返回到根控制器:      popToRootViewControllerAnimated:
 
 > 返回到指定的控制器:   popToViewController: animated:
 注意:这个指定的控制器必须是已经存在于导航控制器栈内的控制器.
 
 
 */
/**
 导航控制器栈:
 作用:就是用来保管导航控制器内所有的子控制器
 
 nav.viewControllers;
 // The view controllers currently on the navigation stack
 stack : 栈的意思
 在导航控制器栈内的所有控制器
 */

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
