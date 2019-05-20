//
//  ViewController.m
//  CALayerBasicAttribute
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

    UIView* redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    // 1>边框
    redView.layer.borderWidth = 10; // 边框的宽度
    redView.layer.borderColor = [UIColor grayColor].CGColor; // 边框的颜色
    // 2>阴影
    redView.layer.shadowOffset = CGSizeZero; // 阴影的偏移量
    redView.layer.shadowColor = [UIColor blueColor].CGColor; // 阴影的颜色
    redView.layer.shadowRadius = 50; // 阴影的半径
    redView.layer.shadowOpacity = 1; // 阴影的透明度
    
    // 3>圆角
    redView.layer.cornerRadius = 50; // 圆角半径
    redView.layer.masksToBounds = YES; // 裁剪超出 layer 范围的东西
    
    // 4>bounds
    //    redView.layer.bounds = CGRectMake(0, 0, 200, 200);
    
    // 5>postion属性和view.center的关系 // 默认 center 跑到 position 的位置上
    //    redView.layer.position = CGPointMake(0, 0);
    
    // 6>设置内容(图片)
    redView.layer.contents = (__bridge id)([UIImage imageNamed:@"me"].CGImage);
    
    [self.view addSubview:redView];
    
    self.layer = redView.layer;
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    //    self.layer.opacity = 0; // 透明度
    
    //    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取手指当前的位置
    CGPoint p = [t locationInView:t.view];
    
    // 让layer 跑到手指的位置
    self.layer.position = p;
}


@end
