//
//  ViewController.m
//  TransitionAnimation
//
//  Created by QinTuanye on 2019/5/22.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView* imageView;

@property (nonatomic, assign) NSInteger imageName;

@end

@implementation ViewController

// 轻扫手势执行的方法
- (IBAction)imageChange:(UISwipeGestureRecognizer*)sender
{
    
    self.imageName++;
    
    if (self.imageName == 5) {
        self.imageName = 0;
    }
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", self.imageName + 1]];
    
    // 1.创建动画
    CATransition* anim = [[CATransition alloc] init];
    
    // 2.操作
    anim.type = @"moveIn";
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        // 从右往左
        // 方向
        anim.subtype = kCATransitionFromRight;
    }
    else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        // 从左往右
        // 方向
        anim.subtype = kCATransitionFromLeft;
    }
    
    // 3.添加动画
    [self.imageView.layer addAnimation:anim forKey:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageName = 0;
}

@end
