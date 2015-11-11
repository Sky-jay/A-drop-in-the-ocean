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

- (void)addFirstSubview
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(120, 120, 135, 40)];
    label.backgroundColor = [UIColor yellowColor];
    label.layer.cornerRadius = 6;
    label.clipsToBounds = YES;
    label.text = @"Hello,code!Hello,World!";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    
    //    label.shadowColor = [UIColor blackColor];
    //    label.shadowOffset = CGSizeMake(5, -3);
    
    //    label.highlighted = YES;
    //    label.highlightedTextColor = [UIColor blueColor];
    
    label.numberOfLines = 1;
    label.adjustsFontSizeToFitWidth = YES;
    /*
     label.lineBreakMode = NSLineBreakByCharWrapping;       以字符为显示单位显示，后面部分省略不显示。
     label.lineBreakMode = NSLineBreakByClipping;           剪切与文本宽度相同的内容长度，后半部分被删除。
     label.lineBreakMode = NSLineBreakByTruncatingHead;     前面部分文字以……方式省略，显示尾部文字内容。
     label.lineBreakMode = NSLineBreakByTruncatingMiddle;   中间的内容以……方式省略，显示头尾的文字内容。
     label.lineBreakMode = NSLineBreakByTruncatingTail;     结尾部分的内容以……方式省略，显示头的文字内容。
     label.lineBreakMode = NSLineBreakByWordWrapping;       以单词为显示单位显示，后面部分省略不显示。
     */
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    
    [self.view addSubview:label];
}

- (void)addSecondSubview
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"Colorful Life! Colorful World!"];
    [attributedString setAttributes:@{NSBackgroundColorAttributeName:[UIColor greenColor],NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(9, 4)];
    [attributedString setAttributes:@{NSBackgroundColorAttributeName:[UIColor yellowColor],NSForegroundColorAttributeName:[UIColor greenColor]} range:NSMakeRange(24, 5)];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(80, 240, 215, 40)];
    label2.attributedText = attributedString;
    label2.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:label2];
}

- (void)addThirdSubview
{
    UILabel *scrollLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 360, 135, 135)];
    scrollLabel.text = @"🍂 🍂      🍂🍂🍂  🍂🍂🍂🍂🍂";
    scrollLabel.numberOfLines = 0;
    
    [self.view addSubview:scrollLabel];
    [self thirdLabelAnimationActionWithLabel:scrollLabel];
}

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
