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

@end

@implementation HMView

// 懒加载 - 初始化
- (NSMutableArray*)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];

        for (int i = 0; i < kButtonCount; ++i) {
            // 创建9个 btn
            UIButton* btn = [[UIButton alloc] init];

            // 禁止用户交互
            [btn setUserInteractionEnabled:NO];

            // 设置 btn 默认的图片
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];

            // 设置 btn 点击高亮的图片(选中状态)
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];

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

    // 遍历所有的 btn
    for (int i = 0; i < self.btns.count; ++i) {
        // 获取 btn
        UIButton* btn = self.btns[i];
        // 判断 手指的位置 是否在 某个按钮的范围之内
        if (CGRectContainsPoint(btn.frame, p)) {
            // 让按钮亮起来(选中状态)
            btn.selected = YES;
        }
    }
}

// 手指离开这个 view 的时候调用
- (void)touchesEnded:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    for (int i = 0; i < self.btns.count; ++i) {
        UIButton* btn = self.btns[i];
        // 取消按钮的高亮效果(选中状态)
        btn.selected = NO;
    }
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
