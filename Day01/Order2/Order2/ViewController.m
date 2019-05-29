//
//  ViewController.m
//  Order2
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

