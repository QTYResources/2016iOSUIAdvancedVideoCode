//
//  ViewController.m
//  ClockPractice3
//
//  Created by QinTuanye on 2019/5/22.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer* second;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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
    
    // 给全局属性赋值
    self.second = second;
    
    // 计时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [self timeChange];
}

// 旋转(一秒一次)
- (void)timeChange
{
    // 一秒钟旋转的角度
    CGFloat angle = 2 * M_PI / 60;
    
    NSDate* date = [NSDate date];
    
    // 真实的时间
    // 15:00:20 000
    
    // 15:00:20 999
    
    //    // 1.nsdate
    //    // 创建一个时间格式化的对象
    //    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    //    formatter.dateFormat = @"ss";
    //    CGFloat time = [[formatter stringFromDate:date] floatValue];
    
    // 2.日历
    NSCalendar* cal = [NSCalendar currentCalendar];
    CGFloat time = [cal component:NSCalendarUnitSecond fromDate:date];
    
    self.second.affineTransform = CGAffineTransformMakeRotation(time * angle);
}


@end
