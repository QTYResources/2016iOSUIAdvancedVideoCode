//
//  ViewController.m
//  DynamicSelfAttribute
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView* redView;
@property (nonatomic, weak) UIView* blueView;

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
    
    UIView* blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(170, [UIScreen mainScreen].bounds.size.height - 50, 50, 50);
    
    [self.view addSubview:blueView];
    
    self.blueView = blueView;
}

// 点击屏幕调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 1.根据某一个范围 创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 2.根据某一个动力学元素 创建行为
    // 重力
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[ self.redView, self.blueView ]];
    
    // 碰撞行为
    UICollisionBehavior* collision = [[UICollisionBehavior alloc] initWithItems:@[ self.redView, self.blueView ]];
    
    // 把引用的view设置为边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 动力学元素 自身属性
    UIDynamicItemBehavior* itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[ self.blueView ]];
    
    //    itemBehavior.elasticity = 1; // 弹力
    //    itemBehavior.density = 0.5; // 密度
    itemBehavior.friction = 0; // 摩擦力
    
    // 3.把行为添加到动画者当中
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
    [self.animator addBehavior:itemBehavior];
}

@end

