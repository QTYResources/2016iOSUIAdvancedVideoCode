//
//  HMGreenViewController.m
//  UseNavigationController
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMGreenViewController.h"
#import "HMBlueViewController.h"

@interface HMGreenViewController ()

@end

@implementation HMGreenViewController


- (IBAction)back2RedVc:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



#pragma mark - 跳转到蓝色控制器
- (IBAction)go2BlueVc:(id)sender {
    
    // 1. 创建蓝色控制器
    HMBlueViewController *blueVc = [[HMBlueViewController alloc] init];
    
    // 2. 执行跳转
    [self.navigationController pushViewController:blueVc animated:YES];
    
    
}

@end
