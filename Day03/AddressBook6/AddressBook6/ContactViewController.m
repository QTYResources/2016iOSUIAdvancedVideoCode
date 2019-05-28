//
//  ContactViewController.m
//  AddressBook6
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController () <UIActionSheetDelegate>

@end

@implementation ContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加左上角注销的按钮
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
    
    self.navigationItem.leftBarButtonItem = item;
}

// 注销按钮的点击事件
- (void)logOut
{
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"你确定要注销嘛?!" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
}

// acitonSheet的点击事件 buttonIndex: 从0开始 从上往下依次递增
- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // 返回上一个控制器
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// item 枚举的区别
- (void)test
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:nil]; // 细
    
    UIBarButtonItem* item1 = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:nil]; // 粗
    
    self.navigationItem.leftBarButtonItems = @[ item, item1 ];
}

@end
