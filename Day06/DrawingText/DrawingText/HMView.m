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

    // 1.文字
    NSString* str = @"黑马程序";

    //    @property (nonatomic, assign) CGSize shadowOffset;      // offset in user space of the shadow from the original drawing
    //    @property (nonatomic, assign) CGFloat shadowBlurRadius; // blur radius of the shadow in default user space units
    //    @property (nullable, nonatomic, strong) id shadowColor;           // color used for the shadow (default is black with an alpha value of 1/3)

    // 创建 shadow
    NSShadow* s = [[NSShadow alloc] init];
    s.shadowOffset = CGSizeMake(150, 50); // 阴影的偏移量
    s.shadowBlurRadius = 2; // 模糊程度 越小越不模糊
    s.shadowColor = [UIColor blueColor]; // 阴影的颜色

    // 2.绘制
    // 2.1 从某一个点开始绘制
    [str drawAtPoint:CGPointZero
        withAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:30],
            NSForegroundColorAttributeName : [UIColor redColor],
            NSUnderlineStyleAttributeName : @(0),
            NSShadowAttributeName : s }];
    // 2.2 绘制到指定的区域
    //    [str drawInRect:CGRectMake(0, 0, 200, 200) withAttributes:nil];
}

@end
