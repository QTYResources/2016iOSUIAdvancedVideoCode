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

    // 路径
    // ArcCenter: 圆心
    // radius: 半径
    // startAngle: 起始"位置"
    // endAngle: 结束"位置"
    // clockwise: 是否是顺时针
//    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI clockwise:1];
    //
    //    // 渲染
//    [path stroke];

        // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
    
        // 拼接路径
        CGContextAddArc(ctx, 150, 150, 100, 0, M_PI_2, 1);
    
        // 渲染
        CGContextStrokePath(ctx);
}

// 椭圆
- (void)test3
{
    // oc 椭圆
    //    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    //
    //    [path stroke];

    // c 椭圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 拼接路径
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 200, 100));

    // 渲染
    CGContextStrokePath(ctx);
}

// 圆角矩形
- (void)test2
{
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:30];
    // 渲染
    [path stroke];
}

// 矩形
- (void)test1
{

    //    // 创建路径
    //    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    //
    //    // 渲染
    //    [path stroke];

    [[UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)] stroke];
}

@end
