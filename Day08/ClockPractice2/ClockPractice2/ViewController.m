//
//  ViewController.m
//  ClockPractice2
//
//  Created by QinTuanye on 2019/5/22.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建表盘
    CALayer* clock = [[CALayer alloc] init];
    clock.bounds = CGRectMake(0, 0, 200, 200); // 大小
    clock.position = CGPointMake(200, 200); // 位置
    // 设置图片
    clock.contents = (__bridge id)[UIImage imageNamed:@"clock"].CGImage;
    // 设置圆角
    clock.cornerRadius = 100;
    clock.masksToBounds = YES;
    
    // 创建秒针
    CALayer* second = [[CALayer alloc] init];
    second.bounds = CGRectMake(0, 0, 2, 100); // 大小
    second.position = clock.position; // 位置
    second.backgroundColor = [UIColor redColor].CGColor; // 颜色
    // 锚点 定位点
    second.anchorPoint = CGPointMake(0.5, 0.8);
    
    // 添加表盘
    [self.view.layer addSublayer:clock];
    
    // 添加秒针
    [self.view.layer addSublayer:second];
}


@end
