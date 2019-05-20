//
//  HMView.h
//  手势解锁
//
//  Created by Romeo on 15/12/8.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMView : UIView

@property (nonatomic, copy) BOOL (^passwordBlock)(NSString*);

@end
