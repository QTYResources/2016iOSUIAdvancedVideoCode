//
//  ViewController.m
//  FlagSelect
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "HMFlag.h"
#import "HMFlagView.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

// 模型数组
@property (nonatomic, strong) NSArray *flags;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 代理方法
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    // 1.创建view
    HMFlagView *flagView = [HMFlagView flagView];
    
#warning 如果显示界面没有铺满的话,可以手动社会它的frame
    flagView.frame = CGRectMake(0, 0, self.view.bounds.size.width, [HMFlagView rowHeight]);
    // 2.给view设置数据
    flagView.flag = self.flags[row];
    
    // 3.返回view
    return flagView;
    
}

// 返回对应的行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return [HMFlagView rowHeight];
}

#pragma mark - 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.flags.count;
}


#pragma mark - 懒加载
- (NSArray *)flags {
    
    if (!_flags) {
        
        // 1.加载数据文件转为字典数组
        
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"03flags.plist" ofType:nil]];
        
        // 2.把字典数组转为模型数组
        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:dictArr.count];
        
        for (NSDictionary *dict in dictArr) {
            
            HMFlag *flag = [HMFlag flagWithDict:dict];
            [temp addObject:flag];
        }
        _flags = temp;
    }
    return _flags;
}
















@end

