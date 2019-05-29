//
//  ViewController.m
//  CustomKeyboard
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 文本框
@property (weak, nonatomic) IBOutlet UITextField *textField;

// 日期选择控件
@property (nonatomic, strong) UIDatePicker *datePicker;

// 工具条
@property (nonatomic, strong) UIToolbar *toolbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置文本框的输入界面为datePicker
    self.textField.inputView = self.datePicker;
    // 设置工具条
    self.textField.inputAccessoryView = self.toolbar;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


// 点击取消按钮的时候调用
- (void)cancelItemClick {
    
    [self.view endEditing:YES];
}

// 点击确认按钮的时候调用
- (void)doneItemClick {
    
    // 1. 获取选中的日期
    NSDate *date = self.datePicker.date;
    
    // 2.将日期设置给文本框
    // 讲日期转为字符串
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd日"; // HH:mm:ss 时分秒
    
    NSString *str = [formatter stringFromDate:date];
    
    // 赋值给文本框
    self.textField.text = str;
    
    
    // 3.关闭键盘
    [self.view endEditing:YES];
    
}








#pragma mark - 懒加载控件 用strong
- (UIToolbar *)toolbar {
    
    if (!_toolbar) {
        // 只需要高度就够了
        _toolbar = [[UIToolbar alloc] init];
        _toolbar.bounds = CGRectMake(0, 0, 0, 44);
        
        // 创建按钮放到工具条里面
        // 取消
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelItemClick)];
        
        // 弹簧
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        // 确认
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(doneItemClick)];
        
        // items里面存放的按钮都是UIBarbuttonItem类型, 而且这些按钮最终是要现实到工具条上的
        _toolbar.items = @[cancelItem, flexSpace, doneItem];
        
        
    }
    return _toolbar;
}




- (UIDatePicker *)datePicker {
    
    if (!_datePicker) {
        // 不需要设置frame 自动占据键盘的位置
        _datePicker = [[UIDatePicker alloc] init];
        // 日期模式
        _datePicker.datePickerMode = UIDatePickerModeDate;
        // 本地化 local
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
    }
    return _datePicker;
    
}















@end

