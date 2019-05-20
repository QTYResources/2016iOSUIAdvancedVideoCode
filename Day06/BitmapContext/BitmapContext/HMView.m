//
//  HMView.m
//  04-绘图的方式
//
//  Created by Romeo on 15/12/5.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMView.h"

@implementation HMView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    // 获取当前 view 的 layer 类型的图形上下文
    NSLog(@"%@", UIGraphicsGetCurrentContext());

    // 开启/创建图片类型的图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    NSLog(@"%@", UIGraphicsGetCurrentContext());

    // 获取当前上下文(图片类型的图形上下文)
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 路径
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);

    // 渲染
    CGContextStrokePath(ctx);

    // 关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    NSLog(@"%@", UIGraphicsGetCurrentContext());
}

@end
