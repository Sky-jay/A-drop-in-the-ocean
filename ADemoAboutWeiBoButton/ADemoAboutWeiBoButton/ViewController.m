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

- (IBAction)btnAction:(UIButton *)sender {
    if (isShow) {
        [self hiddenBtnsWithAnimation:YES];
    }else{
        [self showBtnsWithAnimation:YES];
    }
}

- (void)createBtns
{
    _btns = [NSMutableArray array];
    NSArray *btnImages = @[@"tabbar_compose_camera", @"tabbar_compose_idea", @"tabbar_compose_lbs", @"tabbar_compose_more", @"tabbar_compose_photo", @"tabbar_compose_review"];
    CGFloat btnW = 71.f;
    CGFloat btnH = 71.f;
    CGFloat XMargin = (kScreenW - 3 * btnW) / 4;
    CGFloat YMargin = 32;
    for (int i = 0; i < 6; i++) {
        int row = i / 3;
        int column = i % 3;
        CGFloat btnX = XMargin + (btnW + XMargin) * column;
        CGFloat btnY = YMargin + (btnH + YMargin) * row + kScreenH;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        UIImage *image = [UIImage imageNamed:btnImages[i]];
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [_btns addObject:btn];
    }
}

- (void)showBtnsWithAnimation:(BOOL)isOrNo
{
    if (isOrNo) {
        for (int i = 0; i < 6; i++) {
            UIButton *btn = _btns[i];
            [UIView animateWithDuration:0.8 delay:i * 0.03 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGPoint temp = btn.center;
                temp.y -= 500;
                btn.center = temp;
            } completion:^(BOOL finished) {
                
            }];
        }
    }else{
        for (int i = 0; i < 6; i++) {
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
    
}

@end
