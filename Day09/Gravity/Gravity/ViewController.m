//
//  ViewController.m
//  Gravity
//
//  Created by QinTuanye on 2019/5/23.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView* redView;

@property (nonatomic, strong) UIDynamicAnimator* animator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:redView];
    
    self.redView = redView;
}

// 点击屏幕调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 1.根据某一个范围 创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 2.根据某一个动力学元素 创建行为
    // 重力
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[ self.redView ]];
    
    // 方向
    //    gravity.gravityDirection = CGVectorMake(1, 1); // 用向量的形式设置方向
    //    gravity.angle = M_PI; // 用角度的形式设置方向
    
    // 量级
    gravity.magnitude = 100;
    
    // 3.把行为添加到动画者当中
    [self.animator addBehavior:gravity];
}

@end
