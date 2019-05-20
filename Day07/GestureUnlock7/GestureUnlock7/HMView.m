//
//  HMView.m
//  手势解锁
//
//  Created by Romeo on 15/12/8.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMView.h"

#define kButtonCount 9

@interface HMView ()
@property (nonatomic, strong) NSMutableArray* btns; // 9个按钮的数组

@property (nonatomic, strong) NSMutableArray* lineBtns; // 所有需要连线的按钮

@property (nonatomic, assign) CGPoint currentPoint; // 当前手指的位置

@end

@implementation HMView

// 初始化
- (NSMutableArray*)lineBtns
{
    if (!_lineBtns) {
        _lineBtns = [NSMutableArray array];
    }
    return _lineBtns;
}

// 懒加载 - 初始化
- (NSMutableArray*)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];

        for (int i = 0; i < kButtonCount; ++i) {
            // 创建9个 btn
            UIButton* btn = [[UIButton alloc] init];

            // 设置 tag(生成密码)
            btn.tag = i;

            // 禁止用户交互
            [btn setUserInteractionEnabled:NO];

            // 设置 btn 默认的图片
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];

            // 设置 btn 点击高亮的图片(选中状态)
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];

            // 设置 btn 错误的图片(可用状态)
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_error"] forState:UIControlStateDisabled];

            [self addSubview:btn];
            // 把创建的按钮添加到数组中 方便管理
            [self.btns addObject:btn];
        }
    }
    return _btns;
}

// 手指触摸到这个 view 的时候调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 获取触摸对象
    UITouch* t = touches.anyObject;

    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];

    for (int i = 0; i < self.btns.count; ++i) {
        // 获取 btn
        UIButton* btn = self.btns[i];

        // 如果 btn 的 frame 包含 手指的点
        if (CGRectContainsPoint(btn.frame, p)) {
            // 让按钮亮起来
            btn.selected = YES;
            // 添加到需要画线的数组当中
            [self.lineBtns addObject:btn];
        }
    }
}

// 手指在这个 view 上移动的时候调用
- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{

    // 获取触摸对象
    UITouch* t = touches.anyObject;

    // 获取最新手指的位置
    CGPoint p = [t locationInView:t.view];

    // 给全局属性赋值
    self.currentPoint = p;

    // 遍历所有的 btn
    for (int i = 0; i < self.btns.count; ++i) {
        // 获取 btn
        UIButton* btn = self.btns[i];
        // 判断 手指的位置 是否在 某个按钮的范围之内
        if (CGRectContainsPoint(btn.frame, p)) {
            // 让按钮亮起来(选中状态)
            btn.selected = YES;

            // 判断 如果已经加到了数组当中 那么不再去添加
            if (![self.lineBtns containsObject:btn]) {
                // 添加到需要画线的数组当中
                [self.lineBtns addObject:btn];
            }
        }
    }

    // 重绘
    [self setNeedsDisplay];
}

// 手指离开这个 view 的时候调用
- (void)touchesEnded:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 修改最后手指的位置为需要连线的最后一个按钮的中心 解决最后一根线多出来的问题
    self.currentPoint = [[self.lineBtns lastObject] center];
    // 重绘
    [self setNeedsDisplay];

    // 所有需要画线的 btn 都变成错误的样式
    for (int i = 0; i < self.lineBtns.count; ++i) {
        // 获取 btn
        UIButton* btn = self.lineBtns[i];
        // 让 btn 变成错误的状态的同时 需要取消选中状态
        btn.selected = NO;
        // 让 btn 变成错误的样式(不可用的状态)
        btn.enabled = NO;
    }
    
    
    

    // 拼接密码
    NSString* password = @"";
    for (int i = 0; i < self.lineBtns.count; ++i) {
        // 获取 btn
        UIButton* btn = self.lineBtns[i];

        password = [password stringByAppendingString:[NSString stringWithFormat:@"%ld", btn.tag]];
    }
    if (self.passwordBlock) {
        if (self.passwordBlock(password)) {
            NSLog(@"zhengque");
        }
        else {
            NSLog(@"cuowu");
        }
    }

    // 关闭用户交互
    [self setUserInteractionEnabled:NO];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        // 开启用户交互
        [self setUserInteractionEnabled:YES];

        // 清空
        [self clear];
    });
}

// 清空(恢复到最初始的状态)
- (void)clear
{
    for (int i = 0; i < self.btns.count; ++i) {
        UIButton* btn = self.btns[i];
        // 取消按钮的高亮效果(选中状态)
        btn.selected = NO;
        // 让按钮取消错误的样式(可用状态)
        btn.enabled = YES;
    }

    // 清空所有的线
    [self.lineBtns removeAllObjects];
    // 重绘
    [self setNeedsDisplay];
}

// 画线
- (void)drawRect:(CGRect)rect
{

    // 如果没有需要画线的按钮 那么不需要执行 drawrect 方法
    if (!self.lineBtns.count) {
        return;
    }

    // 创建路径
    UIBezierPath* path = [UIBezierPath bezierPath];

    for (int i = 0; i < self.lineBtns.count; ++i) {
        // 获取 btn
        UIButton* btn = self.lineBtns[i];

        // 如果 是第一个按钮 那么设置为起点
        if (i == 0) {
            [path moveToPoint:btn.center];
        }
        else {
            [path addLineToPoint:btn.center];
        }
    }

    // 连线到手指的位置
    [path addLineToPoint:self.currentPoint];

    // 设置颜色
    [[UIColor whiteColor] set];
    // 设置线宽
    [path setLineWidth:10];
    // 设置连接处的样式
    [path setLineJoinStyle:kCGLineJoinRound];
    // 设置头尾的样式
    [path setLineCapStyle:kCGLineCapRound];

    // 渲染
    [path stroke];
}

// 无论是从 sb 还是 xib 都会调用
//- (void)awakeFromNib
//{
//}

// 计算九宫格
- (void)layoutSubviews
{
    [super layoutSubviews];

    // 计算九宫格位置
    CGFloat w = 74;
    CGFloat h = w;
    int colCount = 3;
    CGFloat margin = (self.frame.size.width - 3 * w) / 4;
    for (int i = 0; i < self.btns.count; i++) {
        CGFloat x = (i % colCount) * (margin + w) + margin;
        CGFloat y = (i / colCount) * (margin + w) + margin;
        [self.btns[i] setFrame:CGRectMake(x, y, w, h)];
    }
}

@end
