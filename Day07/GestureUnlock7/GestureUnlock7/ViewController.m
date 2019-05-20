//
//  ViewController.m
//  GestureUnlock7
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "HMView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HMView *passwordView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置控制器 view 的背景为一张图片(平铺)
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    
    self.passwordView.passwordBlock = ^(NSString* pwd) {
        
        if ([pwd isEqualToString:@"012"]) {
            //
            NSLog(@"正确");
            return YES;
        }
        else {
            NSLog(@"错误");
            
            return NO;
        }
    };
}


@end
