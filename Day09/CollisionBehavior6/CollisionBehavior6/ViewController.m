//
//  ViewController.m
//  CollisionBehavior6
//
//  Created by QinTuanye on 2019/5/23.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface BGView : UIView

@property (nonatomic, assign) CGRect redRect;

@end

@implementation BGView

- (void)drawRect:(CGRect)rect
{
    
    //    UIBezierPath* path = [[UIBezierPath alloc] init];
    //    [path moveToPoint:CGPointMake(0, 200)];
    //    [path addLineToPoint:CGPointMake(200, 250)];
    //
    //    [path stroke];
    
    [[UIBezierPath bezierPathWithRect:self.redRect] stroke];
}

@end

@interface ViewController () <UICollisionBehaviorDelegate>

@property (nonatomic, weak) UIView* redView;
@property (nonatomic, weak) UIView* blueView;

@property (nonatomic, strong) UIDynamicAnimator* animator;

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
    
    [self.view addSubview:redView];
    
    self.redView = redView;
    
    UIView* blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(170, [UIScreen mainScreen].bounds.size.height - 150, 50, 50);
    
    [self.view addSubview:blueView];
    
    self.blueView = blueView;
}

// 点击屏幕调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 1.根据某一个范围 创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 2.根据某一个动力学元素 创建行为
    // 重力
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[ self.redView ]];
    
    // 碰撞行为
    UICollisionBehavior* collision = [[UICollisionBehavior alloc] initWithItems:@[ self.redView, self.blueView ]];
    
    // 把引用 view 的 bounds变成边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 添加边界
    
    // 以一条线为边界
    [collision addBoundaryWithIdentifier:@"key" fromPoint:CGPointMake(0, 200) toPoint:CGPointMake(200, 250)];
    
    // 以一个自定义路径为边界
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:self.blueView.frame];
    [collision addBoundaryWithIdentifier:@"key1" forPath:path];
    
    // action 实时监听 系统会在 view 动得时候执行这个 block
    collision.action = ^{
        NSLog(@"%@", NSStringFromCGRect(self.redView.frame));
        
        BGView* bgview = (BGView*)self.view;
        bgview.redRect = self.redView.frame;
        
        [self.view setNeedsDisplay];
        
    };
    
    // 设置代理
    collision.collisionDelegate = self;
    
    // 3.把行为添加到动画者当中
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

// 碰撞的代理方法
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(nullable id<NSCopying>)identifier atPoint:(CGPoint)p
{
    
    // 需要强转进行判断
    NSString* str = (NSString*)identifier;
    
    if ([str isEqualToString:@"key"]) {
        self.redView.backgroundColor = [UIColor yellowColor];
    }
    else {
        self.redView.backgroundColor = [UIColor redColor];
    }
}

@end
