//
//  ViewController.m
//  ASimpleCalculator
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *computeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置label的圆角大小
    _label.layer.cornerRadius = 6;
    //设置label控件超出view那部份隐藏起来（不设置此项为YES，圆角显示不出来）
    _label.clipsToBounds = YES;
    //设置button的圆角大小
    _computeButton.layer.cornerRadius = 6;
    //设置button控件超出view那部份隐藏起来（不设置此项为YES，圆角显示不出来）
    _computeButton.clipsToBounds = YES;
    
}

- (IBAction)computeButton:(UIButton *)sender {
    //获取第一个TextField输入的值
    NSInteger firstValue = [_firstTextField.text integerValue];
    //获取第二个TextField输入的值
    NSInteger secondValue = [_secondTextField.text integerValue];
    //计算两值之和
    NSInteger result = firstValue + secondValue;
    //将和值转换成字符类型
    NSString *resultString = [NSString stringWithFormat:@"%ld",(long)result];
    //将字符类型的和值赋给label显示
    _label.text = resultString;
#if 0
    //结束编辑，取消键盘显示
    [self.view endEditing:YES];
#else
    //结束编辑，取消键盘的第一响应
    [_firstTextField resignFirstResponder];
    [_secondTextField resignFirstResponder];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
