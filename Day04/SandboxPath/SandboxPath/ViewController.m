//
//  ViewController.m
//  SandboxPath
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // /Users/sen/Library/Developer/CoreSimulator/Devices/192B7C69-A5B1-4D1D-8B60-134E12B60BF8/data/Containers/Data/Application/75E899ED-3236-484B-A1B5-075904543ABE
    
    // /Users/sen/Library/Developer/CoreSimulator/Devices/192B7C69-A5B1-4D1D-8B60-134E12B60BF8/data/Containers/Data/Application/E737FC46-9A6A-443C-A9FA-46B63EBA03D2
    
    // /Users/sen/Library/Developer/CoreSimulator/Devices/192B7C69-A5B1-4D1D-8B60-134E12B60BF8/data/Containers/Data/Application/29BEBF11-9E66-406A-969E-EFAE60C78976
    NSLog(@"%@", NSHomeDirectory());
}


@end
