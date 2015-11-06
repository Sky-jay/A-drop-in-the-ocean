//
//  ViewController.m
//  UIButtonDemo
//
//  Created by qingyun on 15/11/5.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *lightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *light;
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (nonatomic) CGRect restart;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置灯初始状态为灭
    _light.highlighted = YES;
    _restart = _light.frame;
}

- (IBAction)lightSwitchAction:(UIButton *)sender {
    //点击此button更改灯的亮灭，并更改button的状态和显示状态
    if (_lightSwitch.isSelected == NO) {
        [_lightSwitch setSelected:YES];
        _light.highlighted = NO;
    }else{
        [_lightSwitch setSelected:NO];
        _light.highlighted = YES;
    }
}

- (IBAction)btnAction:(UIButton *)sender {
    //设置动画
    //设置动画开始
    [UIView beginAnimations:nil context:nil];
    //设置动画执行多长时间
    [UIView setAnimationDuration:3];
    //设置动画类型
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置多长时间后执行动画
    [UIView setAnimationDelay:0];
    
    //点击对应button执行对应动作
    //设置动作幅度大小参数
    float parameter = 30;
    switch (sender.tag) {
        //向上移动
        case 1:
        {
            //取出当前的位置赋给临时变量
            CGRect temp = _light.frame;
            //改变临时变量位置信息
            temp.origin.y -= parameter;
            //改变位置
            _light.frame = temp;
            _coverView.frame = temp;
        }
            break;
        //向下移动
        case 2:
        {
            //取出当前的位置赋给临时变量
            CGRect temp = _light.frame;
            //改变临时变量位置信息
            temp.origin.y += parameter;
            //改变位置
            _light.frame = temp;
            _coverView.frame = temp;
        }
            break;
        //向左移动
        case 3:
        {
            //取出当前的位置赋给临时变量
            CGRect temp = _light.frame;
            //改变临时变量位置信息
            temp.origin.x -= parameter;
            //改变位置
            _light.frame = temp;
            _coverView.frame = temp;
        }
            break;
        //向右移动
        case 4:
        {
            //取出当前的位置赋给临时变量
            CGRect temp = _light.frame;
            //改变临时变量位置信息
            temp.origin.x += parameter;
            //改变位置
            _light.frame = temp;
            _coverView.frame = temp;
        }
            break;
            
        default:
            break;
    }
    //设置动画结束
    [UIView commitAnimations];
}

- (IBAction)bigBtnAction:(UIButton *)sender {
    //设置放大比例（将其改为小于1即为缩小）
    CGFloat scale = 1.2;
    //取出当前的大小赋给临时变量
    CGRect temp = _light.bounds;
    //改变临时变量的大小信息
    temp.size.width *= scale;
    temp.size.height *= scale;
    //设置动画
    [UIView animateWithDuration:3 animations:^{
        //改变大小
        _light.bounds = temp;
        _coverView.bounds = temp;
    } completion:^(BOOL finished) {    }];
}

- (IBAction)restartBtnAction:(UIButton *)sender {
    [UIView animateWithDuration:3 animations:^{
#if 0
        //无效
        _light.transform = CGAffineTransformIdentity;
#else
        //复原
        _light.frame = _restart;
        _coverView.frame = _restart;
#endif
    } completion:nil];
}

@end
