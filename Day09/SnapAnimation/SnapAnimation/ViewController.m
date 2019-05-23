//
//  ViewController.m
//  SnapAnimation
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

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    
    // 1.动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 2.创建行为
    UISnapBehavior* snap = [[UISnapBehavior alloc] initWithItem:self.redView snapToPoint:p];
    
    snap.damping = 1; // 减速程度
    
    // 3.把行为添加到动画者当中
    [self.animator addBehavior:snap];
}

@end

