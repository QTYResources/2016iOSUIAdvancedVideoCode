//
//  HMImageView.m
//  06-模拟 imageView
//
//  Created by Romeo on 15/12/6.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMImageView.h"

@implementation HMImageView

- (instancetype)initWithImage:(UIImage*)image
{
    self = [super initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    if (self) {
        self.image = image;
    }
    return self;
}

- (void)setImage:(UIImage*)image
{
    _image = image;
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // 把传过来的图片绘制到屏幕上
    [self.image drawInRect:rect];
}

@end
