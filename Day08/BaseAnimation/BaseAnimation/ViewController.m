//
//  ViewController.m
//  BaseAnimation
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
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    self.layer = redView.layer;
    [self.view addSubview:redView];
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 基本动画
    
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
