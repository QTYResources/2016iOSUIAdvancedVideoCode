//
//  Contact.h
//  通讯录
//
//  Created by Romeo on 15/12/2.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* number;

@end
