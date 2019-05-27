//
//  ViewController.m
//  Preferences
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 存数据
- (IBAction)save:(id)sender
{
    
    // 1.不需要关心文件夹和文件的名字
    // 2.快速做键值对
    // 3.用法和字典基本一样
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"value" forKey:@"key"];
    [ud setBool:YES forKey:@"isOn"];
    
    [ud synchronize]; // 立即写入
}

// 取数据
- (IBAction)read:(id)sender
{
    // 获取 ud 单例对象
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@", [ud objectForKey:@"key"]);
    NSLog(@"%ld", [ud boolForKey:@"isOn"]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

