//
//  Teacher.m
//  06-归档解档
//
//  Created by Romeo on 15/12/3.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "Teacher.h"

@interface Teacher () <NSSecureCoding>

@end

@implementation Teacher

// 告诉需要 需要归档哪些属性
- (void)encodeWithCoder:(NSCoder*)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
}

// 告诉系统解档哪些属性
- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
