//
//  ViewController.m
//  Modal1
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 跳转到 testviewcontroller
    
    TestViewController* vc = [[TestViewController alloc] init];
    
    // 加特技!!! duang
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // 以 modal 的形式跳转
    [self presentViewController:vc
                       animated:YES
                     completion:^{
                         NSLog(@"跳转完成");
                     }];
}

@end
