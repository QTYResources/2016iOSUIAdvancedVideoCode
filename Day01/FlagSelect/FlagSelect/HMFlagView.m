//
//  HMFlagView.m
//  FlagSelect
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "HMFlagView.h"
#import "HMFlag.h"

@interface HMFlagView ()

// 国家名称
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

// 国旗图片框
@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@end

@implementation HMFlagView

+ (instancetype)flagView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"HMFlagView" owner:nil options:nil] lastObject];
    
}

+ (CGFloat)rowHeight {
    
    return 83;
}

- (void)setFlag:(HMFlag *)flag {
    
    _flag = flag;
    
    // 分发数据
    self.nameLbl.text = flag.name;
    self.iconView.image = [UIImage imageNamed:flag.icon];
    
    
}

@end
