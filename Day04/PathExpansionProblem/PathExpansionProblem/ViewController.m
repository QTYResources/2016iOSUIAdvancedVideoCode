//
//  ViewController.m
//  PathExpansionProblem
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
}

// 点击屏幕调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // /Users/sen/Library/Developer/CoreSimulator/Devices/77F9B887-C945-4CE1-ADFB-232A844EB534/data/Containers/Data/Application/B4C883D6-D466-4BE1-BA4D-AD20B022012F/Documents
    
    //   ~/Documents
    
    // 如果路径 不展开  系统会把沙盒的根目录 替换成 波浪线(~)
    
    // 获取 doc 的路径
    NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, NO)[0];
    
    NSLog(@"%@", docPath);
    
    //    @[] writeToFile<#(nonnull NSString *)#>: atomically:<#(BOOL)#>
    // atomically 线程同步的
}
@end
