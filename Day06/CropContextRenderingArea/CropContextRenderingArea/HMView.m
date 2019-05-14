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

    // 获取图片对象
    UIImage* image = [UIImage imageNamed:@"me"];

    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 1.先画出来显示的区域
//    CGContextAddArc(ctx, 150, 150, 150, 0, 2 * M_PI, 1);
    CGContextAddRect(ctx, CGRectMake(0, 0, 150, 150));
    CGContextAddRect(ctx, CGRectMake(150, 150, 150, 150));

//    CGContextFillPath(ctx);

        // 2.裁剪
        CGContextClip(ctx);
    
        // 拉伸显示到 view 上
        [image drawInRect:rect];
}

@end
