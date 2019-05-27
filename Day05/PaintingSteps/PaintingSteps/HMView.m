//
//  HMView.m
//  03-绘图的步骤
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

    // 1.获取当前绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.拼接路径 同时 把路径添加到上下文当中
    CGContextMoveToPoint(ctx, 50, 50); // 起点
    CGContextAddLineToPoint(ctx, 100, 100); // 终点
    CGContextAddLineToPoint(ctx, 150, 50);

    CGContextMoveToPoint(ctx, 50, 200);
    CGContextAddLineToPoint(ctx, 200, 200);

    // 3.渲染
    CGContextStrokePath(ctx);
}

@end
