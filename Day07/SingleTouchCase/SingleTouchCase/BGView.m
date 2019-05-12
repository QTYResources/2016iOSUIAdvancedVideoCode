//
//  BGView.m
//  SingleTouchCase
//
//  Created by QinTuanye on 2019/5/12.
//  Copyright © 2019年 QinTuanye. All rights reserved.
//

#import "BGView.h"
#import "HMView.h"

@interface BGView ()

@property (weak, nonatomic) IBOutlet HMView *pinkView;

@end

@implementation BGView

- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    
    // 获取触摸对象
    UITouch* t = touches.anyObject;
    
    // 获取当前点的位置
    CGPoint p = [t locationInView:t.view];
    
    // 获取上一个点的位置
    CGPoint lastP = [t previousLocationInView:t.view];
    
    // 计算偏移量
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    
    // 让粉色的 view 的中心 在自身的基础上加上偏移量
    self.pinkView.center = CGPointMake(self.pinkView.center.x + offsetX, self.pinkView.center.y + 0);
}

@end
