//
//  HMView.m
//  04-绘图的方式
//
//  Created by Romeo on 15/12/5.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMView.h"

@implementation HMView

// 1.代码为什么要写在 drawrect 当中
// 因为在这个方法当中可以获取到正确的上下文

// 2.rect 参数的含义
// 当前 view 的 bounds

// 3.drawrect 什么时候调用?
// 这个方法是系统调用!!!
// (1)当着 view 第一次显示的时候 会调用
// (2)当这个 view 进行重绘的时候 会调用

// 4.如何重绘
// (1)调用某个需要重绘的 view 对象的 setNeedsDisplay
// (2)调用某个需要重绘的 view 对象的 setNeedsDisplayInRect  rect:需要重绘的区域

// 5.为什么不能手动调用 drawrect
// 手动调用的时候可能获取不到正确的上下文

- (void)drawRect:(CGRect)rect
{
    NSLog(@"%@", NSStringFromCGRect(rect));

    
    
    
}

@end
