//
//  HMFlag.m
//  07-国旗选择
//
//  Created by Romeo on 15/11/29.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMFlag.h"

@implementation HMFlag

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)flagWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDict:dict];
}

@end
