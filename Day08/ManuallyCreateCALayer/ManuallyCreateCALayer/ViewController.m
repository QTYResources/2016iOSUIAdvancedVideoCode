//
//  ViewController.m
//  ManuallyCreateCALayer
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer* layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 创建 layer
    CALayer* layer = [[CALayer alloc] init];
    
    layer.backgroundColor = [UIColor redColor].CGColor; // 颜色
    layer.position = CGPointMake(200, 200); // 位置
    layer.bounds = CGRectMake(0, 0, 100, 100); // 大小
    
    // 把 layer 添加到 控制器 view 的 layer 上
    [self.view.layer addSublayer:layer];
    
    // 给全局属性赋值
    self.layer = layer;
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    //    self.layer.opacity = 0; // 透明度
    
    //    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取手指当前的位置
    CGPoint p = [t locationInView:t.view];
    
    // 禁用隐私动画(事务)
    [CATransaction begin]; // 开启事务
    [CATransaction setDisableActions:YES]; // 禁用隐式动画
    
    // 让layer 跑到手指的位置
    self.layer.position = p;
    
    [CATransaction commit]; // 提交事务
}

@end
