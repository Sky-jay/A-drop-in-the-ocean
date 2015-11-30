//
//  UIAlertControllerVC.m
//  SomePopUp
//
//  Created by qingyun on 15/11/29.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "AlertControllerVC.h"

typedef enum{
    ActionSheet = 10,
    Alert,
    HaveTextField
}ButtonAction;

@interface AlertControllerVC ()
@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UILabel *PassWord;

@end

@implementation AlertControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取当前设备的系统版本
    NSLog(@"===Device>>%@===",[[UIDevice currentDevice]systemVersion]);
}
- (IBAction)popUpAction:(UIButton *)sender {
    switch (sender.tag) {
        case ActionSheet:
            [self actionSheetAction];
            break;
        case Alert:
            [self alertAction];
            break;
        case HaveTextField:
            [self withTextFieldAction];
            break;
        default:
            break;
    }
}

- (void)actionSheetAction
{
    // 创建一个UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"UIAlertControllerStyleActionSheet" message:@"Message" preferredStyle:UIAlertControllerStyleActionSheet];
    //创建UIAlertAction
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"DefaultStyle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
    }];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"CancelStyle" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
    }];
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"DestructiveStyle" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
    }];
    //添加action1到alertController
    [alertController addAction:alertAction1];
    [alertController addAction:alertAction2];
    [alertController addAction:alertAction3];
    // 使用模态的方式，显示alertController
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

- (void)alertAction
{
    // 创建一个UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"UIAlertControllerStyleAlert" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    //创建UIAlertAction
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"DefaultStyle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
    }];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"CancelStyle" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
    }];
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"DestructiveStyle" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
    }];
    //添加action1到alertController,此种风格Action超过两个会竖向排列，两个为横向并列。
    [alertController addAction:alertAction1];
    [alertController addAction:alertAction2];
//    [alertController addAction:alertAction3];
    // 使用模态的方式，显示alertController
    [self presentViewController:alertController animated:YES completion:^{}];
}

- (void)withTextFieldAction
{
    // 创建一个UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"UIAlertControllerStyleAlert" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    //创建UIAlertAction
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"DefaultStyle" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
        //在回调Block块中可以取到用户输入的TextField内容。
        NSArray *textFields = alertController.textFields;
        UITextField *textField1 = (UITextField *)textFields.firstObject;
        UITextField *textField2 = (UITextField *)textFields[1];
        _UserName.text = textField1.text;
        _PassWord.text = textField2.text;
    }];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"CancelStyle" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"===%@===",action);
        //也可以通过此方法获取action内容。
        NSArray *actions = alertController.actions;
        UIAlertAction *action1 = (UIAlertAction *)actions.firstObject;
        NSLog(@"===action1>>%@===",action1);
        UIAlertAction *action2 = (UIAlertAction *)actions[1];
        NSLog(@"===action2>>%@===",action2);
    }];
    
    //添加action1到alertController,此种风格Action超过两个会竖向排列，两个为横向并列。
    [alertController addAction:alertAction1];
    [alertController addAction:alertAction2];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"UserName!";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"PassWord!";
    }];
    
    // 使用模态的方式，显示alertController
    [self presentViewController:alertController animated:YES completion:^{}];
}


@end
