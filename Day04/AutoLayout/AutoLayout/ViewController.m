//
//  ViewController.m
//  AutoLayout
//
//  Created by QinTuanye on 2019/5/28.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView* blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(100, 100, 100, 100);
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [redView autoSetDimension:ALDimensionWidth toSize:200];
    [redView autoSetDimension:ALDimensionHeight toSize:150];
    
    //    [redView autoCenterInSuperview];
    
    [redView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:blueView withOffset:8];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
