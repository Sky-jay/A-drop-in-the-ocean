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
    
    //注册通知（键盘的弹出以及返回）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)addSubViews
{
    _textView.backgroundColor = [UIColor greenColor];
    //设置TextView的代理
    _textView.delegate = self;
    [self configTextView];
    
}

- (void)configTextView
{
    //选择文字，设置黑体
    NSRange boldRange = [_textView.text rangeOfString:@"假如"];
    //选择文字，设置带背景颜色
    NSRange bgRang = [_textView.text rangeOfString:@"生活"];
    //选择文字，设置带下划线
    NSRange underLineRang = [_textView.text rangeOfString:@"心儿"];
    //选择文字，设置字体颜色
    NSRange tintedRange = [_textView.text rangeOfString:@"过去"];
    
    //创建一个属性文本
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithAttributedString:_textView.attributedText];
    //添加属性
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:boldRange];
    [attributedStr addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:bgRang];
    [attributedStr addAttribute:NSUnderlineStyleAttributeName value:@1 range:underLineRang];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:tintedRange];
    //添加图片
    //文本附着图片
    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
    //取到图片
    UIImage *image = [UIImage imageNamed:@"假如生活欺骗了你.jpg"];
    //更改图片大小
    UIImage *scaledImage = [self originImage:image scaleToSize:CGSizeMake(365, 250)];
    attachment.image = scaledImage;
    NSAttributedString *attachStr = [NSAttributedString attributedStringWithAttachment:attachment];
    //把图片属性字符串追加到attributedStr后面
    [attributedStr appendAttributedString:attachStr];
    //将属性文本赋值给TextView的属性文本
    _textView.attributedText = attributedStr;
    
}

//重绘图片大小属性
- (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size为要得到的图片大小
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;     //返回已经更改过大小的图片
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishAction:)];
    self.navigationItem.rightBarButtonItem = editButton;
}

- (void)finishAction:(UIBarButtonItem *)btn
{
    [_textView resignFirstResponder];
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSNotificationCenter

- (void)keyBoardHandle:(NSNotification *)notification
{
//    NSLog(@"%@",NSStringFromCGRect(_textView.frame));
    CGRect beginFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat detalY = endFrame.origin.y - beginFrame.origin.y;
    CGRect textViewFrame = _textView.frame;
    textViewFrame.size.height += detalY;
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        _textView.frame = textViewFrame;
    }];
//    NSLog(@"%@",NSStringFromCGRect(_textView.frame));
}

- (void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

@end
