//
//  HMBlueViewController.m
//  UseNavigationController
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMBlueViewController.h"
#import "HMGreenViewController.h"

@interface HMBlueViewController ()

@end

@implementation HMBlueViewController

#pragma mark - 返回到指定控制器
- (IBAction)back2Zhiding:(id)sender {
    
    // 导航控制器栈里面的所有控制器
    NSArray *vcs = self.navigationController.viewControllers;
    
    UIViewController *vc = vcs[1];
    
#warning 错误
    //    HMGreenViewController *greenVc = [[HMGreenViewController alloc] init];
    
    [self.navigationController popToViewController: vc animated:YES];
    
}



#pragma mark - 返回到根控制器
- (IBAction)back2RootVc:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}



#pragma mark - 返回到绿色控制器
- (IBAction)back2GreenVc:(id)sender {
    
    // 直接返回到上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
    
}





@end
