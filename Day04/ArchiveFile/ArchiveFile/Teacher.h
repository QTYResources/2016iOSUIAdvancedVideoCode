//
//  Teacher.h
//  06-归档解档
//
//  Created by Romeo on 15/12/3.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject <NSCoding>

// iOS 模型
// java android    bean javabean 实体类

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) int age;

@end
