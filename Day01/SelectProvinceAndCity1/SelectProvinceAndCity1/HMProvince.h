//
//  HMProvince.h
//  04-省市选择
//
//  Created by Romeo on 15/11/29.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMProvince : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *cities;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)provinceWithDict:(NSDictionary *)dict;

@end
