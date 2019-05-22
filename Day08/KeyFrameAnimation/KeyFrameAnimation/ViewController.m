//
//  ViewController.m
//  KeyFrameAnimation
//
//  Created by QinTuanye on 2019/5/22.
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

    UIView* redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 20, 20);
    redView.backgroundColor = [UIColor redColor];
    self.layer = redView.layer;
    [self.view addSubview:redView];
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 关键帧动画
    
    // 1.做什么动画
    CAKeyframeAnimation* anim = [[CAKeyframeAnimation alloc] init];
    
    // 2.怎么做动画
    anim.keyPath = @"position";
    
    // -----------
    //    NSValue* v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    //    NSValue* v2 = [NSValue valueWithCGPoint:CGPointMake(150, 100)];
    //    NSValue* v3 = [NSValue valueWithCGPoint:CGPointMake(100, 150)];
    //    NSValue* v4 = [NSValue valueWithCGPoint:CGPointMake(150, 150)];
    //
    //    anim.values = @[ v1, v2, v3, v4 ]; // 关键的数据
    // -----------
    
    // 创建路径
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:1];
    
    anim.path = path.CGPath; // 路径
    
    anim.duration = 2; // 时间
    anim.repeatCount = INT_MAX; // 重复次数
    
    // 3.对谁做动画
    [self.layer addAnimation:anim forKey:nil];
}

// 基本动画
- (void)test1
{
    // 1.创建动画对象(做什么动画)
    CABasicAnimation* anim = [[CABasicAnimation alloc] init];
    
    // 2.怎么做动画
    anim.keyPath = @"position.x";
    
    //    anim.fromValue = @(10); // 从哪
    //    anim.toValue = @(300); // 到哪
    
    anim.byValue = @(10); // 在自身的基础上增加
    
    // 不希望回到原来的位置
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    // 3.添加动画(对谁做动画)
    [self.layer addAnimation:anim forKey:nil];
}

@end
