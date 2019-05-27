//
//  AddViewController.m
//  AddressBook2
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField* nameField;
@property (weak, nonatomic) IBOutlet UITextField* numberField;
@property (weak, nonatomic) IBOutlet UIButton* addButton;

@end

@implementation AddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 实时监听两个文本框的内容的变化
    [self.nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.numberField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    // 监听添加按钮的点击事件
    [self.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 让姓名文本框 成为第一响应者
    [self.nameField becomeFirstResponder];
}

// 添加按钮的点击事件
- (void)addClick
{
    
    // 判断代理方法是不是能够响应
    if ([self.delegate respondsToSelector:@selector(addViewController:withContact:)]) {
        
        Contact* con = [[Contact alloc] init];
        con.name = self.nameField.text;
        con.number = self.numberField.text;
        
        // 如果可以响应 那么执行代理方法
        [self.delegate addViewController:self withContact:con];
    }
    
    // 返回上一个控制器(联系人列表)
    [self.navigationController popViewControllerAnimated:YES];
}

// 文本框中文本发生改变的时候调用
- (void)textChange
{
    self.addButton.enabled = self.nameField.text.length > 0 && self.numberField.text.length > 0;
}

@end
