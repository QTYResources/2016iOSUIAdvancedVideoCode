//
//  RedView.m
//  10-initWithCoder
//
//  Created by Romeo on 15/12/3.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "RedView.h"

@implementation RedView

- (instancetype)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"123");
    }
    return self;
}

@end
