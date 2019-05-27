//
//  ViewController.m
//  ArchiveFile
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController

// 存数据
- (IBAction)save:(id)sender
{
    
    // 获取 tmp目录
    NSString* tmpPath = NSTemporaryDirectory();
    // 获取 file path
    NSString* filePath = [tmpPath stringByAppendingPathComponent:@"teacher.data"];
    
    // 创建自定义对象
    Teacher* t = [[Teacher alloc] init];
    t.name = @"德玛西亚";
    t.age = 18;
    
    // 归档
//    [NSKeyedArchiver archiveRootObject:t toFile:filePath];
    NSError *error;
    //会调用对象的encodeWithCoder方法
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:t
                                         requiringSecureCoding:YES
                                                         error:&error];
    if (!error) {
        [data writeToFile:filePath atomically:YES];
    }
}

// 取数据
- (IBAction)read:(id)sender
{
    
    // 获取 tmp目录
    NSString* tmpPath = NSTemporaryDirectory();
    // 获取 file path
    NSString* filePath = [tmpPath stringByAppendingPathComponent:@"teacher.data"];
    
    NSError *error;
//    Teacher* t = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    Teacher *t =[NSKeyedUnarchiver unarchivedObjectOfClass:[Teacher class] fromData:[NSData dataWithContentsOfFile:filePath] error:&error];
    
    NSLog(@"%@", t.name);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

