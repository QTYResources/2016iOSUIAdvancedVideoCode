//
//  HMImageView.h
//  06-模拟 imageView
//
//  Created by Romeo on 15/12/6.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMImageView : UIView

@property (nonatomic, strong) UIImage* image;

- (instancetype)initWithImage:(UIImage *)image;

@end
