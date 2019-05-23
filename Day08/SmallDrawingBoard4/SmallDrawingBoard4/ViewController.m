//
//  ViewController.m
//  SmallDrawingBoard4
//
//  Created by QinTuanye on 2019/5/23.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "HMView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HMView* hmview;
@property (weak, nonatomic) IBOutlet UISlider* lineWidthProgress;
@property (weak, nonatomic) IBOutlet UIButton* firstButton;

@end

@implementation ViewController

// 监听颜色的改变
- (IBAction)lineColorChange:(UIButton*)sender
{
    // 设置颜色
    self.hmview.lineColor = sender.backgroundColor;
}

// 监听线宽改变
- (IBAction)lineWidthChange:(UISlider*)sender
{
    // 把最新的数值(线宽)给了 hmview
    self.hmview.lineWidth = sender.value;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 默认线宽
    self.hmview.lineWidth = self.lineWidthProgress.value;
    
    // 点一下第一个按钮
    [self lineColorChange:self.firstButton];
}


@end
