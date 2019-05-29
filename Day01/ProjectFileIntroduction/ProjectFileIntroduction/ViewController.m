//
//  ViewController.m
//  ProjectFileIntroduction
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    HMTool SU
    // 获取项目的info.plist文件
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    
    HMLog(@"%@", dict);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
