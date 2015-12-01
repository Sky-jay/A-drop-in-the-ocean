//
//  ActionSheetVC.m
//  SomePopUp
//
//  Created by qingyun on 15/11/30.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ActionSheetVC.h"

typedef enum{
    Automatic = 10,
    Default,
    BlackTranslucent,
    BlackOpaque
}ActionSheetStyle;
@interface ActionSheetVC ()<UIActionSheetDelegate>

@end

@implementation ActionSheetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)ActionSheet:(UIButton *)sender {
    switch (sender.tag) {
        case Automatic:
            [self addActionSheetWithStyle:UIActionSheetStyleAutomatic];
            break;
        case Default:
            [self addActionSheetWithStyle:UIActionSheetStyleDefault];
            break;
        case BlackTranslucent:
            [self addActionSheetWithStyle:UIActionSheetStyleBlackTranslucent];
            break;
        case BlackOpaque:
            [self addActionSheetWithStyle:UIActionSheetStyleBlackOpaque];
            break;
            
        default:
            break;
    }
}

- (void)addActionSheetWithStyle:(UIActionSheetStyle)style
{
    //创建一个UIActionSheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"ActionSheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destructive" otherButtonTitles:@"Other", nil];
    //设置风格
    actionSheet.actionSheetStyle = style;
    //添加点击按钮
//    NSInteger btnInteger = [actionSheet addButtonWithTitle:@"AddBtn"];
    //可以通过此方法获取对应button上的title
//    NSString *firstBtnTitle = [actionSheet buttonTitleAtIndex:0];
    //显示actionSheet
    [actionSheet showInView:self.view];

    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(clickActionSheetBtnWithActionSheet:) userInfo:actionSheet repeats:NO];
//    [self performSelector:@selector(clickActionSheetBtnWithActionSheet:) withObject:actionSheet afterDelay:3];
}

- (void)clickActionSheetBtnWithActionSheet:(NSTimer *)timer
{
    [timer.userInfo dismissWithClickedButtonIndex:3 animated:YES];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"===Destructive!===");
            break;
        case 1:
            NSLog(@"===Other!===");
            break;
        case 2:
            NSLog(@"===Cancel!===");
            break;
        case 3:
            NSLog(@"===AddBtn!===");
            break;
            
        default:
            break;
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    NSLog(@"===%s===",__func__);
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    NSLog(@"===%s===",__func__);
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    NSLog(@"===%s===",__func__);
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"===%s===",__func__);
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"===%s===",__func__);
}

@end
