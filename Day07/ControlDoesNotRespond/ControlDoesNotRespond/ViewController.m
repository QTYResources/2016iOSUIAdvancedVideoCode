//
//  ViewController.m
//  ControlDoesNotRespond
//
//  Created by QinTuanye on 2019/5/12.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (IBAction)btnClick:(id)sender {
    NSLog(@"button click");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.imgView addSubview:btn];
}


@end
