//
//  ViewController.m
//  GestureRecognition
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 1.创建手势对象
    
    // 2.对某一个 view 添加手势
    
    // 3.实现手势的方法
    
    // ---------
    
    //UITapGestureRecognizer(敲击)
    // 1.创建手势对象
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    tap.numberOfTapsRequired = 2; // 点几次
    tap.numberOfTouchesRequired = 2; // 几根手指
    
    // 2.对某一个 view 添加手势
    [self.imageView addGestureRecognizer:tap];
    
    // ---------
    //UILongPressGestureRecognizer(长按)
    // 1.创建手势对象
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    longPress.minimumPressDuration = 3; // 长按多长时间有反应
    longPress.allowableMovement = 100; // 误差范围
    
    //
    //    @property (nonatomic) CFTimeInterval minimumPressDuration; // Default is 0.5. Time in seconds the fingers must be held down for the gesture to be recognized
    //    @property (nonatomic) CGFloat allowableMovement;           // Default is 10. Maximum movement in pixels allowed before the gesture fails. Once recognized (after minimumPressDuration) there is no limit on finger movement for the remainder of the touch tracking
    
    // 2.对某一个 view 添加手势
    [self.imageView addGestureRecognizer:longPress];
    
    // ---------
    //UISwipeGestureRecognizer(轻扫)
    
    // 1.创建手势对象
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    UISwipeGestureRecognizer* swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe1.direction = UISwipeGestureRecognizerDirectionLeft;
    // 2.添加手势
    [self.imageView addGestureRecognizer:swipe];
    [self.imageView addGestureRecognizer:swipe1];
    
    // ---------
    
    //UIRotationGestureRecognizer(旋转)
    
    // 1.创建手势对象
    UIRotationGestureRecognizer* rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    
    // 2.添加手势
    [self.imageView addGestureRecognizer:rotation];
    
    // ---------
    //UIPinchGestureRecognizer(捏合，用于缩放)
    
    // 1.创建手势对象
    UIPinchGestureRecognizer* pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    //    pinch.delegate = self;
    
    // 2.添加手势
    [self.imageView addGestureRecognizer:pinch];
    
    // ---------
    //UIPanGestureRecognizer(拖拽)
    
    // 1.创建手势对象
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    // 2.添加手势
    [self.imageView addGestureRecognizer:pan];
    
    // ---------
}

// 解决手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizer
{
    return YES;
}

// 3.实现方法
- (void)pan:(UIPanGestureRecognizer*)sender
{
    
    CGPoint p = [sender translationInView:sender.view];
    
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, p.x, p.y);
    
    // 恢复到初始状态
    [sender setTranslation:CGPointZero inView:sender.view];
}

// 3.实现方法
- (void)pinch:(UIPinchGestureRecognizer*)sender
{
    
    NSLog(@"%f", sender.scale);
    
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale);
    
    // 恢复初始状态
    sender.scale = 1;
}

// 3.实现方法
- (void)rotation:(UIRotationGestureRecognizer*)sender
{
    NSLog(@"%f", sender.rotation);
    
    //    self.imageView.transform = CGAffineTransformMakeRotation(sender.rotation);
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, sender.rotation);
    
    sender.rotation = 0; // "归零" 恢复到最初始的状态
}

// 3.实现手势的方法
- (void)swipe:(UISwipeGestureRecognizer*)sender
{
    
    //    NSLog(@"swipe");
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        //从右往左
        NSLog(@"从右往左");
    }
    else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"从左往右");
    }
}

// 3.实现手势的方法
- (void)longPress:(UILongPressGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"longPress");
    }
}

// 3.实现手势的方法
- (void)tap:(UITapGestureRecognizer*)sender
{
    NSLog(@"你点到我了!!!");
}


@end
