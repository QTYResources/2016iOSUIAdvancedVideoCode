//
//  BGView.m
//  Multi-touchCase
//
//  Created by QinTuanye on 2019/5/12.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "BGView.h"

@interface BGView ()

@property (nonatomic, strong) NSArray* images;

@end

@implementation BGView

- (NSArray*)images
{
    if (!_images) {
        _images = @[ [UIImage imageNamed:@"spark_blue"], [UIImage imageNamed:@"spark_green"] ];
    }
    return _images;
}

// 手指触摸这个 view 的时候调用
- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self addSpark:touches];
}

// 手指在这个 view 移动的时候调用
- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self addSpark:touches];
}

// 根据手指的位置 添加小星星
- (void)addSpark:(NSSet*)touches
{
    int i = 0;
    
    for (UITouch* t in touches) {
        
        // 获取 触摸对象
        //        UITouch* t = touches.anyObject;
        
        // 获取手指的位置
        CGPoint p = [t locationInView:t.view];
        
        // 创建 imageView
        UIImageView* imageView = [[UIImageView alloc] initWithImage:self.images[i]];
        
        // 设置 imageView 的中心为手指的位置
        imageView.center = p;
        
        // 把 imageView 加到黑色 view 上
        [self addSubview:imageView];
        
        // 动画
        [UIView animateWithDuration:2
                         animations:^{
                             imageView.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [imageView removeFromSuperview]; // 移除控件
                         }];
        
        i++;
    }
}
@end

