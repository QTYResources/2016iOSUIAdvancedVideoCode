//
//  HMView.h
//  小画板
//
//  Created by Romeo on 15/12/9.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMView : UIView

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, strong) UIColor* lineColor;

// 清屏
- (void)clear;

// 回退
- (void)back;

// 橡皮
- (void)eraser;

@end
