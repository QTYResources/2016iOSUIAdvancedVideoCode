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

    // 2.拼接路径 同时 把路径添加到上下文当中
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 50);

    // 线宽
    CGContextSetLineWidth(ctx, 30);

    // 连接处的样式
    //    kCGLineJoinMiter, // 默认
    //    kCGLineJoinRound, // 圆角
    //    kCGLineJoinBevel // 切角
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);

    // 头尾的样式
    //    kCGLineCapButt, // 默认
    //    kCGLineCapRound, // 圆角
    //    kCGLineCapSquare // 会比默认的样式两边各多一个线宽/2的距离
    CGContextSetLineCap(ctx, kCGLineCapButt);

    // 3.渲染
    CGContextStrokePath(ctx);
}

@end
