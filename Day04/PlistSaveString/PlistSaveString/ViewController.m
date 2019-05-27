//
//  ViewController.m
//  PlistSaveString
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString* str = @"value";
    
    NSString* tmpPath = NSTemporaryDirectory();
    NSString* filePath = [tmpPath stringByAppendingPathComponent:@"xx.plist"];
    
    [str writeToFile:filePath atomically:YES];
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 获取文件路径
    NSString* tmpPath = NSTemporaryDirectory();
    NSString* filePath = [tmpPath stringByAppendingPathComponent:@"xx.plist"];
    
    NSString* str = [NSString stringWithContentsOfFile:filePath];
    
    NSLog(@"%@", str);
}

@end

