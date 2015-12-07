//
//  ViewController.m
//  ADemoAboutWeiBoButton
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation ViewController

static BOOL isShow = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBtns];
}

- (void)createBtns
{
    _btns = [NSMutableArray array];
    NSArray *btnImages = @[@"tabbar_compose_camera", @"tabbar_compose_idea", @"tabbar_compose_lbs", @"tabbar_compose_more", @"tabbar_compose_photo", @"tabbar_compose_review"];
    CGFloat btnW = 71.f;
    CGFloat btnH = 71.f;
//    CGFloat XMargin = (kScreenW - 3 * btnW) / 4;
    CGFloat XMargin = (CGRectGetWidth(self.view.bounds) - 3 * btnW) / 4;
    CGFloat YMargin = 32;
    for (int i = 0; i < btnImages.count; i++) {
        int row = i / 3;
        int column = i % 3;
        CGFloat btnX = XMargin + (btnW + XMargin) * column;
        CGFloat btnY = YMargin + (btnH + YMargin) * row + kScreenH;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        UIImage *image = [UIImage imageNamed:btnImages[i]];
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        btn.tag = i + 10;
        [btn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [_btns addObject:btn];
    }
}

- (IBAction)btnAction:(UIButton *)sender {
    if (isShow) {
        [self hiddenBtnsWithAnimation:YES];
    }else{
        [self showBtnsWithAnimation:YES];
    }
}

- (void)showBtnsWithAnimation:(BOOL)isOrNo
{
    if (isOrNo) {
        for (int i = 0; i < _btns.count; i++) {
            UIButton *btn = _btns[i];
            
            /**
             duration: 动画时长
             delay: 延迟开始动画时间
             damping: 弹簧阻尼系数(0-1) 1:阻尼最大，没有弹跳效果
             velocity: 初始动力大小 0 自动根据duration和damping来计算
             */
            [UIView animateWithDuration:0.8 delay:i * 0.03 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGPoint temp = btn.center;
                temp.y -= 500;
                btn.center = temp;
            } completion:nil];
        }
    }else{
        for (int i = 0; i < _btns.count; i++) {
            UIButton *btn = _btns[i];
            CGPoint temp = btn.center;
            temp.y -= 500;
            btn.center = temp;
        }
    }
    isShow = YES;
}

- (void)hiddenBtnsWithAnimation:(BOOL)isOrNo
{
    if (isOrNo) {
        for (int i = 0; i < _btns.count; i++) {
            UIButton *btn = _btns[_btns.count - 1 - i];
            
            /**
             duration: 动画时长
             delay: 延迟开始动画时间
             damping: 弹簧阻尼系数(0-1) 1:阻尼最大，没有弹跳效果
             velocity: 初始动力大小 0 自动根据duration和damping来计算
             */
            [UIView animateWithDuration:0.8 delay:i * 0.03 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGPoint temp = btn.center;
                temp.y += 500;
                btn.center = temp;
            } completion:nil];
        }
    }else{
        for (int i = 0; i < _btns.count; i++) {
            UIButton *btn = _btns[i];
            CGPoint temp = btn.center;
            temp.y += 500;
            btn.center = temp;
        }
    }
    isShow = NO;
}

- (void)btnClickAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 10:
            [self doSomethingWithButton:sender];
            break;
        case 11:
            [self doSomethingWithButton:sender];
            break;
        case 12:
            [self doSomethingWithButton:sender];
            break;
        case 13:
            [self doSomethingWithButton:sender];
            break;
        case 14:
            [self doSomethingWithButton:sender];
            break;
        case 15:
            [self doSomethingWithButton:sender];
            break;
            
        default:
            break;
    }
}

- (void)doSomethingWithButton:(UIButton *)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        sender.transform = CGAffineTransformMakeScale(1.6, 1.6);
        sender.alpha = 0.3;
    } completion:^(BOOL finished) {
        sender.transform = CGAffineTransformIdentity;
        sender.alpha = 1.0;
        [self hiddenBtnsWithAnimation:NO];
    }];
}

@end
