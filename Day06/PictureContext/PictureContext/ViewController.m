//
//  ViewController.m
//  PictureContext
//
//  Created by QinTuanye on 2019/5/14.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 开启图片类型的图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
    
    // 获取当前的上下文(图片类型)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 拼接路径 同时 把路径添加上上下文当中
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    
    // 渲染
//    CGContextStrokePath(ctx);
    
    // 通过图片类型的图形上下文 获取图片对象
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    
    // 把获取到的图片 放到 图片框上
    self.imageView.image = image;
}

@end
