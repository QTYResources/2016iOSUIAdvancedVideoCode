//
//  HMView.m
//  小画板
//
//  Created by Romeo on 15/12/9.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMView.h"

@interface HMBezierPath : UIBezierPath

@property (nonatomic, strong) UIColor* lineColor1;

@end

@implementation HMBezierPath

@end

@interface HMView ()

//@property (nonatomic, strong) HMBezierPath* path;

@property (nonatomic, strong) NSMutableArray* paths; // 管理路径的数组

@end

@implementation HMView

- (NSMutableArray*)paths
{
    if (!_paths) {
        _paths = [NSMutableArray array];
    }

    return _paths;
}

//// 懒加载 创建路径
//- (HMBezierPath*)path
//{
//    if (!_path) {
//        _path = [[HMBezierPath alloc] init];
//    }
//    return _path;
//}

// 清屏
- (void)clear
{
    [self.paths removeAllObjects];
    // 重绘
    [self setNeedsDisplay];
}

// 回退
- (void)back
{
    [self.paths removeLastObject];
    // 重绘
    [self setNeedsDisplay];
}

// 橡皮
- (void)eraser
{
    self.lineColor = self.backgroundColor;
}

// 手指在这个 view 上触摸的时候调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 获取触摸对象
    UITouch* t = touches.anyObject;

    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];

    HMBezierPath* path = [[HMBezierPath alloc] init];

    // 设置线宽
    [path setLineWidth:self.lineWidth];
    [path setLineColor1:self.lineColor];

    // 起点
    [path moveToPoint:p];

    // 把每一次新创建的路径 添加到数组当中
    [self.paths addObject:path];
}

// 手指在这个 view 上移动的时候调用
- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 获取触摸对象
    UITouch* t = touches.anyObject;

    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];

    // 连线的点
    [[self.paths lastObject] addLineToPoint:p];

    // 重绘
    [self setNeedsDisplay];
}

// 画线
- (void)drawRect:(CGRect)rect
{

    // 遍历所有的路径
    for (HMBezierPath* path in self.paths) {
        // 设置连接处的样式
        [path setLineJoinStyle:kCGLineJoinRound];
        // 设置头尾的样式
        [path setLineCapStyle:kCGLineCapRound];

        // 设置颜色
        [path.lineColor1 set];

        // 渲染
        [path stroke];
    }
}

@end
