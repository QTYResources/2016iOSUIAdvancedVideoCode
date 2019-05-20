//
//  ViewController.m
//  SaveImageIntoAlbum
//
//  Created by QinTuanye on 2019/5/20.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 3.获取图片
    UIImage* image = [UIImage imageNamed:@"me"];
    
    // 1.开启图片类型的图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 5.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画一个裁剪的图片
    CGContextAddArc(ctx, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5, 0, 2 * M_PI, 1);
    
    // 6.裁剪
    CGContextClip(ctx);
    
    // 7.把图片画上去
    [image drawAtPoint:CGPointZero];
    
    // 8.取出来
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 2.关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    
    // 测试
    self.imageView.image = newImage;
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), @"123123123");
}

// 保存到相册的回调
- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
    NSLog(@"保存完成 - %@", contextInfo);
}

@end
