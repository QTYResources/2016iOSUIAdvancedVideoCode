//
//  HEIMBaseController.m
//  NavigationControllerLifeCycle
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HEIMBaseController.h"

@interface HEIMBaseController ()

@end

@implementation HEIMBaseController

//- (void)viewDidLoad {
//
//    [super viewDidLoad];
//
//    NSLog(@"%@--->界面加载完成", [self class]);
//}
//
//
//- (void)viewWillAppear:(BOOL)animated {
//
//    [super viewWillAppear:animated];
//
//    NSLog(@"%@ --->界面即将显示", [self class]);
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//
//    [super viewDidAppear:animated];
//
//    NSLog(@"%@ ---> 界面已经显示出来",[self class]);
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//
//    [super viewWillDisappear:animated];
//
//    NSLog(@"%@ ---> 界面即将消失", [self class]);
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//
//    [super viewDidDisappear:animated];
//
//    NSLog(@"%@ ---> 界面已经消失", [self class]);
//}


- (void)dealloc {
    
    NSLog(@"%@ --- dealloc", [self class]);
}














@end
