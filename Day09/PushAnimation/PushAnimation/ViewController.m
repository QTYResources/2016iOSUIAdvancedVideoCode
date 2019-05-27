//
//  ViewController.m
//  PushAnimation
//
//  Created by QinTuanye on 2019/5/27.
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
    
    UIView* redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    self.redView = redView;
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    
    // 1.创建动画者
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //    UIPushBehaviorModeContinuous, // 持续的推力(越来越快)
    //    UIPushBehaviorModeInstantaneous // 瞬时的推力(越来越慢)
    
    // 2.创建行为
    UIPushBehavior* push = [[UIPushBehavior alloc] initWithItems:@[ self.redView ] mode:UIPushBehaviorModeInstantaneous];
    
    // 计算偏移量
    CGFloat offsetX = -(p.x - self.redView.center.x);
    CGFloat offsetY = -(p.y - self.redView.center.y);
    
    // 方向
    //        push.angle = M_PI; // 用角度的形式设置方向
    push.pushDirection = CGVectorMake(-offsetX, -offsetY);
    
    // 量级 (放在设置向量的后面)
    push.magnitude = 1;
    
    // 3.把行为添加到动画者当中
    [self.animator addBehavior:push];
}

@end

