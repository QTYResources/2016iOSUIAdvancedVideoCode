//
//  HMView.m
//  TouchEventParameter
//
//  Created by QinTuanye on 2019/5/12.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "HMView.h"

@implementation HMView

// 手指接触到这个 view 的时候调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    NSSet* set = [NSSet setWithObjects:@"hello", @"1231", @"123", @"123", @"123", @"123", @"123", @"123", @"123", @"123", @"123", @"123", @"123", @321, @321, @321, @321, @"123", nil];
    
    NSLog(@"%ld", set.count);
    
    // 获取触摸对象
    UITouch *t = touches.anyObject;
        NSLog(@"%ld", t.tapCount); // 快速点击的次数
    
        NSLog(@"%ld", t.phase); // 触摸的阶段
    
        NSLog(@"%@", t.window); // 触摸的对象所在的 window
        NSLog(@"%@", [UIApplication sharedApplication].keyWindow); // 主窗口
        NSLog(@"%@", self.window); // 当前 view 所在的 window
    
        NSLog(@"%@", t.view); // 触摸的 view
        NSLog(@"%@", self); // 自己
    
     // 以哪个 view 为坐标系 返回所在的位置
        CGPoint p = [t locationInView:self.superview];
    
        NSLog(@"%@", NSStringFromCGPoint(p));
    
    // set
    // 无序
    // anyObject
    // 效率高
    // 如何遍历:forin
    // 元素不能重复
    
    // array
    // 有序
    // 通过下标
    // 如何遍历:for forin
}

- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 上一个点的位置
    CGPoint lastP = [t previousLocationInView:self];
    NSLog(@"%@-上一个点", NSStringFromCGPoint(lastP));
    
    // 当前点的位置
    CGPoint p = [t locationInView:self];
    NSLog(@"%@-当前点", NSStringFromCGPoint(p));
}

@end
