//
//  BGView.m
//  04-绘图的方式
//
//  Created by Romeo on 15/12/6.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "BGView.h"

@implementation BGView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    // 平铺图片设置背景
    [[UIImage imageNamed:@"bg"] drawAsPatternInRect:rect];
}

@end
