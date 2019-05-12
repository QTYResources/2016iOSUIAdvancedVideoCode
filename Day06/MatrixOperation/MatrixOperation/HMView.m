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

    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 矩阵操作
    //    Current graphics state's Transformation Matrix
    // 旋转
    //    CGContextRotateCTM(ctx, M_PI_4);
    // 缩放
    //    CGContextScaleCTM(ctx, 1, 0.5);
    // 平移
    //    CGContextTranslateCTM(ctx, 150, 150);

    // 2.拼接路径 同时 把路径添加到上下文当中
    //    CGContextAddArc(ctx, 150, 150, 100, 0, 2 * M_PI, 1);
    //    CGContextMoveToPoint(ctx, 0, 0);
    //    CGContextAddLineToPoint(ctx, 300, 300);

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 150, 150, 100, 0, 2 * M_PI, 1);
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 300, 300);

    // 添加路径到上下文当中
    CGContextAddPath(ctx, path);

    // 设置线宽
    CGContextSetLineWidth(ctx, 10);

    // 3.渲染
    CGContextStrokePath(ctx);
}

@end
