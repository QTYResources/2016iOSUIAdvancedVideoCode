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

    // 释放
    //    CGPathRelease(path);
    CFRelease(path);
}

@end
