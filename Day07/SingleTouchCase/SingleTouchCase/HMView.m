//
//  HMView.m
//  SingleTouchCase
//
//  Created by QinTuanye on 2019/5/12.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "HMView.h"

@implementation HMView

// 点击这个 view 的时候调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取当前点的位置
    CGPoint p = [t locationInView:self.superview];
    
    // 让粉色 view 的中心 等于手指的位置
    self.center = p;
}

// 手指在这个 view 上移动的时候调用
- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取当前的位置
    CGPoint p = [t locationInView:self];
    
    //  获取上一个点的位置
    CGPoint lastP = [t previousLocationInView:self];
    
    // 计算偏移量
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    
    // 让粉色的 view 的中心 等于 手指最新的位置
    //    self.center = p;
    
    // 让粉色 view 在自身 center 的基础上加上偏移量
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
}

@end
