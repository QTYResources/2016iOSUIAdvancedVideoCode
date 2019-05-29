//
//  ViewController.m
//  Order1
//
//  Created by QinTuanye on 2019/5/29.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *foods;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *fruitLbl;

@property (weak, nonatomic) IBOutlet UILabel *mainFoodLbl;

@property (weak, nonatomic) IBOutlet UILabel *drinkLbl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 懒加载
- (NSArray *)foods {
    
    if (_foods == nil) {
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"01foods.plist" ofType:nil]];
    }
    return _foods;
}



@end

