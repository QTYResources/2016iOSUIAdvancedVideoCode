//
//  ViewController.m
//  SmallDrawingBoard5
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

// 清屏
- (IBAction)clear:(id)sender
{
    [self.hmview clear];
}

// 回退
- (IBAction)back:(id)sender
{
    [self.hmview back];
}

// 橡皮
- (IBAction)eraser:(id)sender
{
    [self.hmview eraser];
}

// 保存到相册
- (IBAction)save:(id)sender
{
    
    // 1.开启图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(self.hmview.bounds.size, NO, 0);
    
    // 4.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.截图
    [self.hmview.layer renderInContext:ctx];
    
    // 5.取图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 2.关闭上下文
    UIGraphicsEndImageContext();
    
    // 6.保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}

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
