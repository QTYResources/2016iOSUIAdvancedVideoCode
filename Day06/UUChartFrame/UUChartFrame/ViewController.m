//
//  ViewController.m
//  UUChartFrame
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "UUChart.h"

@interface ViewController () <UUChartDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建表格
    UUChart* chart = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(0, 20, 375, 200) withSource:self withStyle:UUChartBarStyle];
    
    [chart showInView:self.view];
}

- (NSArray*)UUChart_xLableArray:(UUChart*)chart
{
    return @[ @"黑马程序员", @"传智播客", @"前锋" ];
}

- (NSArray*)UUChart_yValueArray:(UUChart*)chart
{
    return @[ @[ @"100", @"80", @"50" ], @[ @"90", @"70", @"10" ] ];
}

- (NSArray*)UUChart_ColorArray:(UUChart*)chart
{
    return @[ [UIColor blueColor], [UIColor redColor] ];
}

@end
