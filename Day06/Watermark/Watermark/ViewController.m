//
//  ViewController.m
//  Watermark
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 3.获取图片
    UIImage* image = [UIImage imageNamed:@"scene"];
    
    // 1.开启图片类型的图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 6.画大图
    [image drawAtPoint:CGPointZero];
    
    // 4.文字
    NSString* str = @"黑马13期";
    
    // 5.画文字水印
    [str drawAtPoint:CGPointMake(20, 20) withAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:20] }];
    
    // 7.图片
    UIImage* logo = [UIImage imageNamed:@"logo"];
    
    // 8.画图片水印
    [logo drawAtPoint:CGPointMake(image.size.width * 0.6, image.size.height * 0.7)];
    
    // 取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    
    // 2.关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    
    NSLog(@"test");
}

@end
