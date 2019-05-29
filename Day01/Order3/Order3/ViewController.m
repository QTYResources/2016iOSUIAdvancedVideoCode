//
//  ViewController.m
//  Order3
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *foods;

// 水果
@property (nonatomic, weak) IBOutlet UILabel *fruitLbl;

// 主菜
@property (nonatomic, weak) IBOutlet UILabel *mainFoodLbl;

// 酒水
@property (nonatomic, weak) IBOutlet UILabel *drinkLbl;


@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;


// 随机点餐
- (IBAction)randomBtnClick:(id)sender;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // 默认选中数据
    //    [self pickerView:self.pickerView didSelectRow:0 inComponent:1];
    for (int i = 0; i < self.foods.count; ++i) {
        [self pickerView:self.pickerView didSelectRow:0 inComponent:i];
    }
}

// 点击随机点餐按钮的时候调用
- (IBAction)randomBtnClick:(id)sender {
    
    // 遍历集合中的所有组
    for (int i = 0; i < self.foods.count; ++i) {
        
        // 第i组里面的所有数据
        NSUInteger count = [self.foods[i] count];
        
        // 生成随机数去选中
        u_int32_t ranNum = arc4random_uniform((int)count);
        
        // 获取第i组当前选中的行
        NSInteger selRowNum = [self.pickerView selectedRowInComponent:i];
        
        // 如果随机数与当前选中的行号一致,需要重新生成随机数
        while (selRowNum == ranNum) {
            ranNum = arc4random_uniform((int)count);
        }
        
        // 让pickerView选中数据
        [self.pickerView selectRow:ranNum inComponent:i animated:YES];
        
        // 将数据现实到label上
        [self pickerView:self.pickerView didSelectRow:ranNum inComponent:i];
    }
    
    
    
    
}

#pragma mark - 代理方法
// 选中某一组的某一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *selFood = self.foods[component][row];
    
    NSLog(@"%@", selFood);
    
    switch (component) {
        case 0:
            self.fruitLbl.text = selFood;
            break;
            
        case 1:
            self.mainFoodLbl.text = selFood;
            break;
            
        case 2:
            self.drinkLbl.text = selFood;
            break;
            
        default:
            break;
    }
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger) row forComponent:(NSInteger)component {
    
    //    NSArray *comFoods = self.foods[component];
    //    NSString *food = comFoods[row];
    
    //    return food;
    
    return self.foods[component][row];
    
}


#pragma mark- 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return self.foods.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.foods[component] count];
    
}

#pragma mark - 懒加载
- (NSArray *)foods {
    
    if (_foods == nil) {
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"01foods.plist" ofType:nil]];
    }
    return _foods;
}




@end

