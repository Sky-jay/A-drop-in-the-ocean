//
//  ViewController.m
//  UILabelDemo
//
//  Created by qingyun on 15/11/11.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define screenW [UIScreen mainScreen].bounds.size.width
#define sand random()%320

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFirstSubview];
    [self addSecondSubview];
    [self addThirdSubview];
}

//创建并添加第一个Label
- (void)addFirstSubview
{
    //创建Label并初始化位置大小
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(120, 120, 135, 40)];
    //设置背景颜色
    label.backgroundColor = [UIColor yellowColor];
    //设置圆角
    label.layer.cornerRadius = 6;
    label.clipsToBounds = YES;
    //设置内容
    label.text = @"Hello,code!Hello,World!";
    //设置字体颜色
    label.textColor = [UIColor redColor];
    //设置字体大小
    label.font = [UIFont systemFontOfSize:14];
    //设置字体居中
    label.textAlignment = NSTextAlignmentCenter;
    //设置阴影颜色
    //    label.shadowColor = [UIColor blackColor];
    //设置阴影偏移量
    //    label.shadowOffset = CGSizeMake(5, -3);
    //设置是否允许高亮
    //    label.highlighted = YES;
    //设置高亮颜色
    //    label.highlightedTextColor = [UIColor blueColor];
    //设置显示行数
    label.numberOfLines = 1;
    //设置字体大小适应Label宽度
    label.adjustsFontSizeToFitWidth = YES;
    /*设置字体显示样式
     label.lineBreakMode = NSLineBreakByCharWrapping;       以字符为显示单位显示，后面部分省略不显示。
     label.lineBreakMode = NSLineBreakByClipping;           剪切与文本宽度相同的内容长度，后半部分被删除。
     label.lineBreakMode = NSLineBreakByTruncatingHead;     前面部分文字以……方式省略，显示尾部文字内容。
     label.lineBreakMode = NSLineBreakByTruncatingMiddle;   中间的内容以……方式省略，显示头尾的文字内容。
     label.lineBreakMode = NSLineBreakByTruncatingTail;     结尾部分的内容以……方式省略，显示头的文字内容。
     label.lineBreakMode = NSLineBreakByWordWrapping;       以单词为显示单位显示，后面部分省略不显示。
     */
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    //将Label添加到self.view上
    [self.view addSubview:label];
}

//创建并添加第二个Label
- (void)addSecondSubview
{
    //创建属性字符串并初始化文本内容
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"Colorful Life! Colorful World!"];
    //设置属性文本中Life的字体颜色和背景颜色
    [attributedString setAttributes:@{NSBackgroundColorAttributeName:[UIColor greenColor],NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(9, 4)];
    //设置属性文本中World的字体颜色和背景颜色
    [attributedString setAttributes:@{NSBackgroundColorAttributeName:[UIColor yellowColor],NSForegroundColorAttributeName:[UIColor greenColor]} range:NSMakeRange(24, 5)];
    //创建label2并初始化位置和大小
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(80, 240, 215, 40)];
    //将属性字符串赋给label2
    label2.attributedText = attributedString;
    //设置label2的字体大小根据label宽度改变
    label2.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:label2];
}

//创建并添加第三个Label
- (void)addThirdSubview
{
    //创建scrollLabel并初始化位置和大小
    UILabel *scrollLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 360, 135, 135)];
    //设置内容
    scrollLabel.text = @"🍂🍃🍂      🍂🍂🍃🍂  🍂🍂🍂🍃🍂🍂";
    //设置显示行数
    scrollLabel.numberOfLines = 0;
    
    [self.view addSubview:scrollLabel];
    //调用动画效果
    [self thirdLabelAnimationActionWithLabel:scrollLabel];
}

//实现动画效果
- (void)thirdLabelAnimationActionWithLabel:(UILabel *)label
{
#if 0
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionRepeat|UIViewKeyframeAnimationOptionAutoreverse animations:^{
        
        scrollLabel.frame = CGRectMake(sand, 560, 80, 50);
        
    } completion:^(BOOL finished) {
        
        label.frame = CGRectMake(sand, 0, 80, 50);
        
    }];
#else
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:0];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:LONG_MAX];
    
    label.frame = CGRectMake(screenW - 80, 300, 80, 50);
    
    [UIView commitAnimations];
    
#endif
}

@end
