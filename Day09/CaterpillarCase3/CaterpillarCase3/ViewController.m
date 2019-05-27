//
//  ViewController.m
//  CaterpillarCase3
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIDynamicAnimator* animator;

@property (nonatomic, strong) UIAttachmentBehavior* att;

@property (nonatomic, strong) NSMutableArray* bodys;

@end

@implementation ViewController

// 懒加载初始化
- (NSMutableArray*)bodys
{
    if (!_bodys) {
        _bodys = [NSMutableArray array];
    }
    return _bodys;
}

- (UIDynamicAnimator*)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 9; ++i) {
        UIView* wormView = [[UIView alloc] init];
        
        // 计算 frame
        CGFloat w = 30;
        CGFloat h = 30;
        CGFloat x = i * w;
        CGFloat y = 100;
        
        wormView.frame = CGRectMake(x, y, w, h); // frame
        wormView.backgroundColor = [UIColor redColor]; // 设置颜色
        // 圆角
        wormView.layer.cornerRadius = w * 0.5;
        wormView.layer.masksToBounds = YES;
        
        if (i == 8) { // 头
            wormView.frame = CGRectMake(x, y - h * 0.5, 2 * w, 2 * h);
            wormView.backgroundColor = [UIColor blueColor];
            wormView.layer.cornerRadius = w;
            
            // 1.添加一个拖拽手势
            UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
            // 2.对某个view使用这个手势
            [wormView addGestureRecognizer:pan];
        }
        
        [self.view addSubview:wormView]; // 添加到控制器
        [self.bodys addObject:wormView];
    }
    
    for (int i = 0; i < self.bodys.count - 1; ++i) {
        // 附着
        UIAttachmentBehavior* attachment = [[UIAttachmentBehavior alloc] initWithItem:self.bodys[i] attachedToItem:self.bodys[i + 1]];
        [self.animator addBehavior:attachment];
    }
    
    // 重力
    UIGravityBehavior* g = [[UIGravityBehavior alloc] initWithItems:self.bodys];
    [self.animator addBehavior:g];
    
    // 碰撞
    UICollisionBehavior* collision = [[UICollisionBehavior alloc] initWithItems:self.bodys];
    // 把引用的 view 设置成边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:collision];
}

// 3.实现拖拽手势的方法
- (void)pan:(UIPanGestureRecognizer*)sender
{
    
    // 获取手指的位置
    CGPoint p = [sender locationInView:self.view];
    
    // 1.创建动画者对象
    // -见懒加载
    
    // 2.创建附着行为
    if (!self.att) {
        UIAttachmentBehavior* att = [[UIAttachmentBehavior alloc] initWithItem:sender.view attachedToAnchor:p];
        self.att = att;
    }
    
    // 修改手指的位置
    self.att.anchorPoint = p;
    
    // 3.把行为添加到动画者对象当中
    [self.animator addBehavior:self.att];
    
    // 撒手的时候
    if (sender.state == UIGestureRecognizerStateEnded) {
        // 移除掉 手指和头的附着行为
        [self.animator removeBehavior:self.att];
    }
}

@end

