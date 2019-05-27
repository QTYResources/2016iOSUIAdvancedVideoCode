//
//  ViewController.m
//  AttachmentAnimation2
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface BGView : UIView

@property (nonatomic, assign) CGPoint start;
@property (nonatomic, assign) CGPoint end;

@end

@implementation BGView

- (void)drawRect:(CGRect)rect
{
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:self.start];
    [path addLineToPoint:self.end];
    
    [path stroke];
}

@end

@interface ViewController ()

@property (nonatomic, weak) UIView* redView;

@property (nonatomic, strong) UIDynamicAnimator* animator;

@property (nonatomic, strong) UIAttachmentBehavior* attach;

@end

@implementation ViewController

- (void)loadView
{
    self.view = [[BGView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    
    redView.alpha = 0.5;
    
    [self.view addSubview:redView];
    
    self.redView = redView;
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    
    // 1.创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 2.创建行为
    self.attach = [[UIAttachmentBehavior alloc] initWithItem:self.redView attachedToAnchor:p];
    
    // 固定长度
    //    self.attach.length = 100;
    
    self.attach.damping = 0.5; // 减幅
    self.attach.frequency = 0.5; // 频率
    
    // 3.把行为添加到动画者对象当中
    [self.animator addBehavior:self.attach];
    
    // 重力行为
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[ self.redView ]];
    // 添加重力行为
    [self.animator addBehavior:gravity];
}

- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    
    self.attach.anchorPoint = p;
    
    __weak ViewController* weakSelf = self;
    self.attach.action = ^{
        BGView* bgview = (BGView*)weakSelf.view;
        bgview.start = weakSelf.redView.center;
        bgview.end = p;
        
        [weakSelf.view setNeedsDisplay];
    };
}

@end

