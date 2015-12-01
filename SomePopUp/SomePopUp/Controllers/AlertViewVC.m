//
//  AlertViewVC.m
//  SomePopUp
//
//  Created by qingyun on 15/11/30.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "AlertViewVC.h"

typedef enum{
    Default = 10,
    SecureTextInput,
    PlainTextInput,
    LoginAndPasswordInput
}AlertViewStyle;

@interface AlertViewVC ()<UIAlertViewDelegate>

@end

@implementation AlertViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)alertViewAction:(UIButton *)sender {
    switch (sender.tag) {
        case Default:
            [self addAlertViewWithStyle:UIAlertViewStyleDefault];
            break;
        case SecureTextInput:
            [self addAlertViewWithStyle:UIAlertViewStyleSecureTextInput];
            break;
        case PlainTextInput:
            [self addAlertViewWithStyle:UIAlertViewStylePlainTextInput];
            break;
        case LoginAndPasswordInput:
            [self addAlertViewWithStyle:UIAlertViewStyleLoginAndPasswordInput];
            break;
            
        default:
            break;
    }
    
}

- (void)addAlertViewWithStyle:(UIAlertViewStyle)style
{
    //创建一个UIalertView
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"AlertView" message:@"Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    //设置alertView的风格
    alertView.alertViewStyle = style;
    //添加点击button
    NSInteger addButtonIndex = [alertView addButtonWithTitle:@"Other"];
    NSLog(@"===addButtonIndex>>%ld===",(long)addButtonIndex);
    //根据buttonIndex获取btn的标题
    NSString *buttonTitle = [alertView buttonTitleAtIndex:0];
    NSLog(@"===buttonTitle>>%@===",buttonTitle);
    //显示alertView
    [alertView show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"===Cancel!===");
            break;
        case 1:
            NSLog(@"===OK!===");
            break;
        case 2:
            NSLog(@"===Other!===");
            break;
        default:
            break;
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    return YES;
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    NSLog(@"===%s===",__func__);
}

@end
