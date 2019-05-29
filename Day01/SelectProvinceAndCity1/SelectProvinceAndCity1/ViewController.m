//
//  ViewController.m
//  SelectProvinceAndCity1
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "HMProvince.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *provinces;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 代理方法显示每一行的文字
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    // 如果选中的是第0组 省 需要刷新城市
    if (component == 0) {
        [pickerView reloadComponent:1];
    }
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    // 第0组 省 返回模型省 的name
    if (component == 0) {
        HMProvince *pro = self.provinces[row];
        return pro.name;
    } else {
        // 第1组 市 根据第0组显示的省,把省里面的所有城市就是要显示的内容
        NSInteger selProIdx = [pickerView selectedRowInComponent:0];
        HMProvince *selPro = self.provinces[selProIdx];
        
        return selPro.cities[row];
    }
    
}



#pragma mark - 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    // 如果是第0组 省  行数就是模型数组数量
    if (component == 0) {
        return self.provinces.count;
        
    } else {
        // 如果是第1组 市  行数
        // 1.获取第0组省显示的是哪个省
        // 先获取第0组 选中的行号
        NSInteger selProIdx = [pickerView selectedRowInComponent:0];
        // 从集合中获取数据
        HMProvince *selPro = self.provinces[selProIdx];
        
        // 2.根据省的城市数据去确定城市的行数
        return selPro.cities.count;
        
    }
    
    
    
}


#pragma mark - 懒加载
- (NSArray *)provinces {
    
    if (!_provinces) {
        
        // 加载为字典数组
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"02cities.plist" ofType:nil]];
        
        // 转为模型数组
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        for (NSDictionary *dict in dictArr) {
            
            HMProvince *pro = [HMProvince provinceWithDict:dict];
            [arrM addObject:pro];
            
        }
        //        _provinces = [arrM copy];
        _provinces = arrM;
        
    }
    return _provinces;
}











@end

