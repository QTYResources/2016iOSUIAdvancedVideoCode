//
//  EditViewController.m
//  AddressBook2
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField* nameField;
@property (weak, nonatomic) IBOutlet UITextField* numberField;
@property (weak, nonatomic) IBOutlet UIButton* saveButton;

@end

@implementation EditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置初始的文本框的内容(传过来的内容)
    self.nameField.text = self.contact.name;
    self.numberField.text = self.contact.number;
    
    // 监听保存按钮的点击事件
    [self.saveButton addTarget:self
                        action:@selector(saveClick)
              forControlEvents:UIControlEventTouchUpInside];
}

// 保存按钮的点击事件
- (void)saveClick
{
    
    self.contact.name = self.nameField.text;
    self.contact.number = self.numberField.text;
    
    Contact* con = [[Contact alloc] init];
    //    con.name = self.nameField.text;
    //    con.number = self.numberField.text;
    
    // 判断代理方法是不是能够响应
    if ([self.delegate
         respondsToSelector:@selector(editViewController:withContact:)]) {
        
        // 如果可以响应那么执行代理方法
        [self.delegate editViewController:self withContact:con];
    }
    
    // 返回到上一个页面
    [self.navigationController popViewControllerAnimated:YES];
}

// 右上角编辑按钮点击事件
- (IBAction)editClick:(UIBarButtonItem*)sender
{
    if (self.saveButton.hidden) { // 点击编辑
        sender.title = @"取消";
        self.nameField.enabled = YES;
        self.numberField.enabled = YES;
        self.saveButton.hidden = NO;
        
        // 让电话的文本框成为第一响应者
        [self.numberField becomeFirstResponder];
    }
    else { // 点击取消
        sender.title = @"编辑";
        self.nameField.enabled = NO;
        self.numberField.enabled = NO;
        self.saveButton.hidden = YES;
        
        // 恢复到传过来的模型的数据
        self.nameField.text = self.contact.name;
        self.numberField.text = self.contact.number;
    }
}

@end
