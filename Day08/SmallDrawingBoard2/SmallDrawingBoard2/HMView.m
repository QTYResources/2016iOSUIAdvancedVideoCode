//
//  HMView.m
//  小画板
//
//  Created by Romeo on 15/12/9.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMView.h"

@interface HMView ()

@property (nonatomic, strong) UIBezierPath* path;

@end

@implementation HMView

// 懒加载 创建路径
//- (UIBezierPath*)path
//{
//    if (!_path) {
//        _path = [[UIBezierPath alloc] init];
//    }
//    return _path;
//}

// 手指在这个 view 上触摸的时候调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
   
    // 获取触摸对象
    self.path = [[UIBezierPath alloc] init];
    UITouch* t = touches.anyObject;

    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];

//        UIBezierPath* path = [[UIBezierPath alloc] init];
    // 起点
    [self.path moveToPoint:p];

}

// 手指在这个 view 上移动的时候调用
- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{

    UITouch* t = touches.anyObject;

    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];

    // 连线的点
    [self.path addLineToPoint:p];
    // 重绘
    [self setNeedsDisplay];
}

// 画线
- (void)drawRect:(CGRect)rect
{
   
    [self.path stroke];
}

@end
