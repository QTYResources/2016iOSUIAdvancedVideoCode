//
//  ViewController.m
//  AddressBook2
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField* usernameField;
@property (strong, nonatomic) IBOutlet UITextField* passwordField;
@property (strong, nonatomic) IBOutlet UIButton* loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 监听文本框
    [self.usernameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

// 文本框内容发生改变的时候调用
- (void)textChange
{
    //    if (self.usernameField.text.length > 0 && self.passwordField.text.length > 0) {
    //        // 两个文本框都有内容
    //        self.loginButton.enabled = YES;
    //    }
    //    else {
    //        // 两个文本框不都有内容
    //        self.loginButton.enabled = NO;
    //    }
    
    self.loginButton.enabled = self.usernameField.text.length > 0 && self.passwordField.text.length > 0;
}

- (void)这些都是文本框的代理方法
{
    
    // 是否允许这个文本框进行编辑
    //- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField
    //{
    //    NSLog(@"textFieldShouldBeginEditing");
    //    NSLog(@"%@", self.usernameField.text);
    //
    //    return NO;
    //}
    
    // 文本框已经开始编辑
    //- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //     NSLog(@"%@", self.usernameField.text);
    //}
    
    // 是否允许这个文本框结束编辑
    //- (BOOL)textFieldShouldEndEditing:(UITextField*)textField
    //{
    //    return NO;
    //}
    
    // 文本框已经结束编辑
    //- (void)textFieldDidEndEditing:(UITextField*)textField
    //{
    //    NSLog(@"123");
    //}
    
    // 是否允许文本框改变文字内容
    //- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
    //{
    //    NSLog(@"%@", self.usernameField.text);
    //    return NO;
    //
    //}
}

@end
