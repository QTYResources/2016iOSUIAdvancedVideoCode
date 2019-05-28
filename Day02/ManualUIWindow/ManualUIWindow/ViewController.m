//
//  ViewController.m
//  ManualUIWindow
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)addWindowBtnClick:(UIButton *)sender {
    
    // 创建一个红色的 window
    UIWindow *redW = [[UIWindow alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    redW.backgroundColor = [UIColor redColor];
    
    // 掌握
    redW.hidden = NO;
    
    [self.view addSubview:redW];
    
    // 创建一个按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [redW addSubview:btn];
    
    
    // 什么时候会用到 window ?
    
    // 对第三方框架,用的比较多,尤其是那种提示类的框架,会用到,主要提示用户耐心等耐加载完成.
    
    // 有时候有的框架,
    //    [[UIApplication sharedApplication].keyWindow addSubview:customWindow];
    //    [[[UIApplication sharedApplication].windows lastObject] addSubview:customWindow];
    
}

- (void)btnClick {
    
    NSLog(@"点了加号按钮");
}

@end

