//
//  ViewController.m
//  Screenshots
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
    
    // 开启图片类型的图形上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    // 获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 截图 把view 的内容 放到上下文中 然后 渲染
    [self.view.layer renderInContext:ctx];
    
    // 取图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}


@end
