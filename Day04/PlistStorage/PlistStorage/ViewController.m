//
//  ViewController.m
//  PlistStorage
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 存数据
- (IBAction)save:(id)sender
{
    // 获取 doc 路径
    
    // 1.1拼接字符串
    //    NSString* homePath = NSHomeDirectory();
    //    NSString* docPath = [homePath stringByAppendingString:@"/Documents"];
    // 1.2拼接字符串
    //        NSString* homePath = NSHomeDirectory();
    //    NSString * docPath = [homePath stringByAppendingPathComponent:@"Documents"];
    
    // 2.搜索的形式
    // SearchPath 搜索路径  ForDirectories 搜索哪个文件夹  InDomains 在哪个区域当中
    NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    // ---
    NSString* filePath = [docPath stringByAppendingPathComponent:@"xx.plist"];
    
    // 数组
    //    NSArray* array = @[ @"1", @"321", @"德玛西亚" ];
    //    [array writeToFile:filePath atomically:YES];
    
    // 字典
    NSDictionary* dict = @{ @"key" : @"value" };
    [dict writeToFile:filePath atomically:YES];
    
    NSLog(@"%@", docPath);
}

// 取数据
- (IBAction)read:(id)sender
{
    // 获取 doc 路径
    NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    // 获取文件路径
    NSString* filePath = [docPath stringByAppendingPathComponent:@"xx.plist"];
    
    // 解析
    //    NSArray* array = [NSArray arrayWithContentsOfFile:filePath];
    
    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSLog(@"%@", dict);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

