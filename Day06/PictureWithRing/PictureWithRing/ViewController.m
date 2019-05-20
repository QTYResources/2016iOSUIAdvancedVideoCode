//
//  ViewController.m
//  PictureWithRing
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 3.获取图片
    UIImage* image = [UIImage imageNamed:@"me"];
    
    // 4.margin
    CGFloat margin = 20;
    
    // 5.计算图片类型的图形上下文的大小
    CGSize ctxSize = CGSizeMake(image.size.width + 2 * margin, image.size.height + 2 * margin);
    
    // 1.开启图片类型的图形上下文
    UIGraphicsBeginImageContextWithOptions(ctxSize, NO, 0);
    
    // 6.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 8.计算圆心
    CGPoint arcCenter = CGPointMake(ctxSize.width * 0.5, ctxSize.height * 0.5);
    
    // 9.计算半径
    CGFloat radius = (image.size.width + margin) * 0.5;
    
    // 7.画圆环
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, radius, 0, 2 * M_PI, 1);
    
    // 10.设置宽度
    CGContextSetLineWidth(ctx, margin);
    
    // 11.渲染圆环
    CGContextStrokePath(ctx);
    
    // 12.画头像显示的区域
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, image.size.width * 0.5, 0, 2 * M_PI, 1);
    
    // 13.裁剪显示区域
    CGContextClip(ctx);
    
    // 14.画图片
    [image drawAtPoint:CGPointMake(margin, margin)];
    
    // 获取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 2.关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}


@end
