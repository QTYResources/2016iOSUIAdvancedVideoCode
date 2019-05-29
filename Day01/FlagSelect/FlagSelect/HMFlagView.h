//
//  HMFlagView.h
//  FlagSelect
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMFlag;
@interface HMFlagView : UIView

// 绑定一个模型用来设置数据
@property (nonatomic, strong) HMFlag *flag;

// 快速创建一个flagView界面
+ (instancetype)flagView;

// 返回这个xib的高度,供外界使用
+ (CGFloat)rowHeight;

@end
