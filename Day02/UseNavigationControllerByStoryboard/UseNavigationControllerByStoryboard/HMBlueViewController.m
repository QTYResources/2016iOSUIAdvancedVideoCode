//
//  HMBlueViewController.m
//  UseNavigationControllerByStoryboard
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMBlueViewController.h"

@interface HMBlueViewController ()

@end

@implementation HMBlueViewController

#pragma mark - 返回到制定控制器
- (IBAction)back2ZhiDing:(id)sender {
    
    // 1.获取指定的控制器
    NSArray *vcs = self.navigationController.viewControllers;
    
    // 2.返回到指定控制器
    [self.navigationController popToViewController:vcs[0] animated:YES];
    
    
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)back2Root:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
