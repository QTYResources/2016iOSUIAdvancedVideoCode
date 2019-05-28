//
//  AppDelegate.m
//  ApplicationObjectIntroduction
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


// 应用程序加载完毕
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"应用程序加载完毕");
    return YES;
}

// 即将变为不活跃状态 [失去焦点]
- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSLog(@"即将变为不活跃状态 [失去焦点]");
    
    
    
}

// 应用程序进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    NSLog(@"应用程序进入后台");
    
    
}

// 即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    NSLog(@"即将进入前台");
    
    
}

// 应用变为活跃状态
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    NSLog(@"应用变为活跃状态[获取焦点]");
    
}

// 应用即将销毁
- (void)applicationWillTerminate:(UIApplication *)application {
    
    NSLog(@"应用即将销毁");
    
    
}

// 应用接收到内存警告
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
    NSLog(@"应用接收到内存警告");
    
}

@end
