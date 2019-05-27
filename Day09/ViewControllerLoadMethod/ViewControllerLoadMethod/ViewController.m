//
//  ViewController.m
//  ViewControllerLoadMethod
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 重写控制器的 view
//- (void)loadView
//{
//        self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        self.view.backgroundColor = [UIColor redColor];
    
//    NSLog(@"loadView");
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    
    [self.view addSubview:[[UISwitch alloc] init]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
