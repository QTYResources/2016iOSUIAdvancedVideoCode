//
//  ViewController.m
//  TestPass
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 点击屏幕的调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 顺传
    // 1.在 b 控制器的.h当中声明一个对应类型(需要传过来的值的类型)的属性
    // 2.在 b 控制器对象中 直接赋值!!
    
    NSString* str = @"value11111";
    
    // 创建 b 控制器
    TestViewController* vc = [[TestViewController alloc] init];
    
    vc.str = str;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    
}

@end

