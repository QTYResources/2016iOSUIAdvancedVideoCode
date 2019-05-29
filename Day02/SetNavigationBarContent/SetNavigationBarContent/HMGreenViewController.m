//
//  HMGreenViewController.m
//  SetNavigationBarContent
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMGreenViewController.h"
#import "HMBlueViewController.h"

@interface HMGreenViewController ()

@end

@implementation HMGreenViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // 4.当这个控制器不是导航控制器的控制器, 如果在左侧放置了按钮
    // 那么系统生成返回按钮,就不复存在了.
    
    // 放到绿色控制导航栏左侧的一个按钮
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(carmraClick)];
    
    self.navigationItem.leftBarButtonItem = left;
    
}

- (void)carmraClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}


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

