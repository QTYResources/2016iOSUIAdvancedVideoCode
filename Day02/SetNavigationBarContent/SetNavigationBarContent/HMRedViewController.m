//
//  HMRedViewController.m
//  SetNavigationBarContent
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMRedViewController.h"
#import "HMGreenViewController.h"

@interface HMRedViewController ()

@end

@implementation HMRedViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
#pragma mark - 设置导航控制器的导航栏的内容
    //    self.navigationItem : 获取当前控制器的导航栏
    
    // 1.设置标题
    // 文字
    self.navigationItem.title = @"红色控制器";
    
    // 设置控件
    //    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    //    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //
    //    self.navigationItem.titleView = addBtn;
    
    // 2.设置按钮
    // 左侧
    // 创建一个 UIBarButtonItem 类型的按钮
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(carmraClick)];
    //    self.navigationItem.leftBarButtonItem = left;
    
    // 右侧的按钮
    //    self.navigationItem.rightBarButtonItem = left;
    
    
    UIBarButtonItem *left2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trashClick)];
    
    // 多个按钮
    //    self.navigationItem.rightBarButtonItems = @[left, left2];
    
    self.navigationItem.leftBarButtonItems = @[left, left2];
    
    // 3.返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"FANHUI" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
}

- (void)addBtnClick {
    
    NSLog(@"吃饭了");
    
}

- (void)carmraClick {
    
    NSLog(@"打开相机吗?");
}

- (void)trashClick {
    
    NSLog(@"打开垃圾桶");
}

- (IBAction)go2GreenVc:(UIButton *)sender {
    
    // 1.创建绿色控制器
    HMGreenViewController *greenVc = [[HMGreenViewController alloc] init];
    
    // 2.跳转
    //    self.navigationController 获取当前控制器的导航控制器
    [self.navigationController pushViewController:greenVc animated:YES];
    
}



@end

