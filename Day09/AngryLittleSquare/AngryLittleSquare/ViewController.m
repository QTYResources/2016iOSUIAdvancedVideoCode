//
//  ViewController.m
//  AngryLittleSquare
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIDynamicAnimator* animator;

@property (nonatomic, strong) UIGravityBehavior* gravity;

@property (nonatomic, weak) UIView* pig;

@end

@implementation ViewController

struct YHValue {
    CGFloat startValue;
    CGFloat endValue;
};
typedef struct YHValue YHValue;

static inline YHValue
YHValueMake(CGFloat startValue, CGFloat endValue)
{
    YHValue value;
    value.startValue = startValue;
    value.endValue = endValue;
    return value;
}

// 懒加载
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
    
    // 添加小鸟
    UIView* bird = [[UIView alloc] init];
    bird.frame = CGRectMake(150, 250, 30, 30);
    bird.backgroundColor = [UIColor redColor];
    [self.view addSubview:bird];
    
    // 为小鸟添加一个拖拽的手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [bird addGestureRecognizer:pan];
    
    // 添加🐷
    UIView* pig = [[UIView alloc] init];
    pig.frame = CGRectMake(500, 300, 30, 30);
    pig.backgroundColor = [UIColor blueColor];
    [self.view addSubview:pig];
    
    self.pig = pig;
    
    // 碰撞行为
    UICollisionBehavior* collision = [[UICollisionBehavior alloc] initWithItems:@[ bird, pig ]];
    // 设置代理
    collision.collisionDelegate = self;
    
    // 把引用的 view 设置成边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
}

// item 之间碰撞的代理方法
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    NSLog(@"6666");
    
    // 重力
    [self.gravity addItem:self.pig];
}

// 实现小鸟拖拽的方法
- (void)pan:(UIPanGestureRecognizer*)sender
{
    
    // 获取移动的偏移量
    CGPoint offset = [sender translationInView:sender.view];
    
    // 当前手指的位置
    CGPoint currentPoint = [sender locationInView:self.view];
    
    // 计算最后的偏移量
    CGFloat offsetX = sender.view.center.x - currentPoint.x;
    CGFloat offsetY = sender.view.center.y - currentPoint.y;
    
    // 计算拖动的距离
    CGFloat distance = sqrt(offsetX * offsetX + offsetY * offsetY);
    
    // 绘制一个范围
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, sender.view.center.x, sender.view.center.y, 100, 0, 2 * M_PI, 1);
    
    if (CGPathContainsPoint(path, NULL, currentPoint, NO)) {
        
        // 撒手的时候
        if (sender.state == UIGestureRecognizerStateEnded) {
            // 添加重力
            UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[ sender.view ]];
            self.gravity = gravity;
            [self.animator addBehavior:gravity];
            
            // 添加推力
            UIPushBehavior* push = [[UIPushBehavior alloc] initWithItems:@[ sender.view ] mode:UIPushBehaviorModeInstantaneous];
            
            // 设置方向
            push.pushDirection = CGVectorMake(offsetX, offsetY);
            
            // 推力量级
            push.magnitude = [self resultWithConsult:distance andResultValue:YHValueMake(0, 1) andConsultValue:YHValueMake(0, 100)];
            [self.animator addBehavior:push];
            
            NSLog(@"%f", push.magnitude);
            NSLog(@"%f", distance);
        }
    }
    else {
        return;
    }
    
    // 改变红色 view 的 transform
    sender.view.transform = CGAffineTransformTranslate(sender.view.transform, offset.x, offset.y);
    
    // 归0
    [sender setTranslation:CGPointZero
                    inView:sender.view];
}

/**
 *  根据参考获取结果
 *
 *  @param consule      参考值
 *  @param resultValue  结果的start到end
 *  @param consultValue 参考的start到end
 *
 *  @return 结果指
 */
- (CGFloat)resultWithConsult:(CGFloat)consule andResultValue:(YHValue)resultValue andConsultValue:(YHValue)consultValue
{
    // 0 - 100
    
    // 0 - 1
    
    // a * r.start + b = c.start
    // a * r.end + b = c.end
    
    // a * (r.start - r.end) + b = c.start - c.ent;
    CGFloat a = (resultValue.startValue - resultValue.endValue) / (consultValue.startValue - consultValue.endValue);
    CGFloat b = resultValue.startValue - (a * consultValue.startValue);
    
    return a * consule + b;
}
@end

