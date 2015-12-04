//
//  ViewController.m
//  TextViewDemo
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}

- (void)addSubViews
{
    _textView.backgroundColor = [UIColor grayColor];
    //设置TextView的代理
    _textView.delegate = self;
    [self configTextView];
    
}

- (void)configTextView
{
    //选择文字设置，黑体
    NSRange boldRange = [_textView.text rangeOfString:@"假如"];
    //
    NSRange bgRang = [_textView.text rangeOfString:@"生活"];
    //
    NSRange underLineRang = [_textView.text rangeOfString:@"心儿"];
    //
    NSRange tintedRange = [_textView.text rangeOfString:@"过去"];
    
    //
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithAttributedString:_textView.attributedText];
    //
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:boldRange];
    [attributedStr addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:bgRang];
    [attributedStr addAttribute:NSUnderlineStyleAttributeName value:@1 range:underLineRang];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:tintedRange];
    //
    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
    attachment.image = [UIImage imageNamed:@"假如生活欺骗了你.jpg"];
    NSAttributedString *attachStr = [NSAttributedString attributedStringWithAttachment:attachment];
    //
    [attributedStr appendAttributedString:attachStr];
    
    _textView.attributedText = attributedStr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
