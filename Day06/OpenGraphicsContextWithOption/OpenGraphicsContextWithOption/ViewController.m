//
//  ViewController.m
//  OpenGraphicsContextWithOption
//
//  Created by QinTuanye on 2019/5/14.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    NSLog(@"%f", [UIScreen mainScreen].scale);
    
    // 开启图片类型的图形上下文
    //        UIGraphicsBeginImageContext(CGSizeMake(300, 300));
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, 0);
    
    //  UIGraphicsBeginImageContext(CGSizeMake(300, 300)); <==>  UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, 1);
    
    // 获取当前的上下文(图片类型)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 拼接路径 同时 把路径添加上上下文当中
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    
    // 渲染
    CGContextStrokePath(ctx);
    
    // 通过图片类型的图形上下文 获取图片对象
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    
    // 把获取到的图片 放到 图片框上
    self.imageView.image = image;
    
    // 获取 doc 路径
    NSString* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    // 获取文件路径
    NSString* filePath = [docPath stringByAppendingPathComponent:@"xx.png"];
    
    // 1.把 image 对象转化成 nsdata
    NSData* data = UIImagePNGRepresentation(image);
    //    NSData* data = UIImageJPEGRepresentation(image, 0);
    //     2.通过 data 的 write to file 写入到沙盒中
    [data writeToFile:filePath atomically:YES];
}

@end
