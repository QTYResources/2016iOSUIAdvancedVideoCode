//
//  BGView.m
//  09-基本动画(CABasicAnimation)
//
//  Created by Romeo on 15/12/9.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "BGView.h"

@implementation BGView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    // 创建路径
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:1];

    [path stroke];
}

@end
