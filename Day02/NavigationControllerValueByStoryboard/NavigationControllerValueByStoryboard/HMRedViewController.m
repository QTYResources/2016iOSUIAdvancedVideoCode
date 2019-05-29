//
//  HMRedViewController.m
//  NavigationControllerValueByStoryboard
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMRedViewController.h"
#import "HMGreenViewController.h"

@interface HMRedViewController ()


@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation HMRedViewController

#pragma mark - 点击绿色按钮执行
- (IBAction)greenBtnClick:(id)sender {
    
    
    
    // 将文本框的内容传递给绿色控制器的导航栏的 title
    // 没法传值
    //    UIStoryboardSegue;
    /**
     destination  单词: 目的地
     identifier                 标记
     sourceViewController       源控制器
     destinationViewController  目标控制器
     */
    
}

#pragma mark - Navigation
// 通过 storyboard拖线的方式实现跳转的时候就会调用这个方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // 获取文本框的内容
    NSString *text = self.textField.text;
    
    // 获取目标控制器
    HMGreenViewController *greenVc = segue.destinationViewController;
    
    // 设置标题
    greenVc.navigationItem.title = text;
    
}

















@end

