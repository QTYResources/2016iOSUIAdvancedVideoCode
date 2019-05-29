//
//  HMGreenViewController.m
//  SetNavigationBarContentByStoryboard
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMGreenViewController.h"

@interface HMGreenViewController ()

@end

@implementation HMGreenViewController

#pragma mark - 返回到红色控制器
- (IBAction)back2Red:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
