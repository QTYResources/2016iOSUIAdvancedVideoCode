//
//  HMRedViewController.m
//  UseNavigationController
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMRedViewController.h"
#import "HMGreenViewController.h"

@interface HMRedViewController ()

@end

@implementation HMRedViewController

- (IBAction)go2GreenVc:(UIButton *)sender {
    
    // 1.创建绿色控制器
    HMGreenViewController *greenVc = [[HMGreenViewController alloc] init];
    
    // 2.跳转
    //    self.navigationController 获取当前控制器的导航控制器
    [self.navigationController pushViewController:greenVc animated:YES];
    
}



@end
