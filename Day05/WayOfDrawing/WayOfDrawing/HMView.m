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

    [self test5];
}

- (void)test5
{
    // 5. oc

    // 创建路径对象
    UIBezierPath* path = [UIBezierPath bezierPath];
    // 通过路径对象 拼接路径
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];

    // 渲染
    [path stroke];
}

- (void)test4
{
    // 4.c + oc

    // 1.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.拼接路径(c)
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 100, 100);

    // 3.拼接路径(oc)
    UIBezierPath* path1 = [UIBezierPath bezierPathWithCGPath:path];
    [path1 addLineToPoint:CGPointMake(150, 50)];

    // 4.把路径添加到上下文当中
    CGContextAddPath(ctx, path1.CGPath);

    // 5.渲染
    CGContextStrokePath(ctx);
}

- (void)test3
{
    // 3. c + oc

    // 1.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.拼接路径(oc)
    UIBezierPath* path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];

    // 3.把路径添加到上下文当中(如何把 oc 的 path 转成 c 的 path)
    CGContextAddPath(ctx, path.CGPath);

    // 4.渲染
    CGContextStrokePath(ctx);
}

// 2. c
- (void)test2
{
    // 1.获取当前绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.拼接路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 100, 200);

    // 3.把路径添加到上下文当中
    CGContextAddPath(ctx, path);

    // 4.渲染
    CGContextStrokePath(ctx);
}

// 1. c
- (void)test1
{
    // 1.获取当前绘图上下文 (layer)
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.拼接路径 同时 把路径添加到上下文当中
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);

    // 3.渲染
    CGContextStrokePath(ctx);
}

@end
