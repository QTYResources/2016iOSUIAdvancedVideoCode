//
//  ViewController.m
//  CALayerTransformProperty
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 创建 layer
    CALayer *layer = [[CALayer alloc] init];
    
    layer.backgroundColor = [UIColor redColor].CGColor; // 颜色
    layer.position = CGPointMake(200, 200);             // 位置
    layer.bounds = CGRectMake(0, 0, 100, 100);          // 大小
    
    layer.contents = (__bridge id)[UIImage imageNamed:@"me"].CGImage;
    
    // 把 layer 添加到 控制器 view 的 layer 上
    [self.view.layer addSublayer:layer];
    
    // 给全局属性赋值
    self.layer = layer;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 旋转
    self.layer.transform =
    CATransform3DRotate(self.layer.transform, M_PI_4, 0, 0, 1);
    
    // 缩放(z无效)
    //    self.layer.transform = CATransform3DScale(self.layer.transform, 1, 1,
    //    0.5);
    
    // 平移(z无效)
    self.layer.transform = CATransform3DTranslate(self.layer.transform, 0, 0, 10);
}

@end
