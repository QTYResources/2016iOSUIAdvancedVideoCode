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

    // 绘制图片(大图)
    UIImage* image = [UIImage imageNamed:@"dst2"];

    // 从某一个点开始绘制
    //    [image drawAtPoint:CGPointMake(0, 0)];

    // 绘制到某一个区域(拉伸)
    //        [image drawInRect:rect];

    // 平铺到某一个区域(平铺)
    [image drawAsPatternInRect:rect];

    // -----------------

    // 绘制图片(小图)
    //    UIImage* image = [UIImage imageNamed:@"me"];

    // 从某一个点开始绘制
    //    [image drawAtPoint:CGPointMake(50, 50)];

    // 绘制到某一个区域(拉伸)
    //    [image drawInRect:rect];

    // 平铺到某一个区域(平铺)
    //    [image drawAsPatternInRect:rect];
}

@end
