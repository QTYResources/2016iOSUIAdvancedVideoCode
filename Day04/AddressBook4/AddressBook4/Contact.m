//
//  Contact.m
//  通讯录
//
//  Created by Romeo on 15/12/2.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "Contact.h"

@implementation Contact

// 告诉系统归档哪些属性
- (void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeObject:_number forKey:@"number"];
}

// 告诉系统解档哪些属性
- (instancetype)initWithCoder:(NSCoder*)coder
{
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:@"name"];
        _number = [coder decodeObjectForKey:@"number"];
    }
    return self;
}

@end
