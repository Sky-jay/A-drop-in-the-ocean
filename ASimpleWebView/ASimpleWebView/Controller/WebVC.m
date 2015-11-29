//
//  WebVC.m
//  ASimpleWebView
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "WebVC.h"
#import "FavoritesVC.h"

@interface WebVC ()
@property (weak, nonatomic) IBOutlet UIWebView *WebView;

@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _URLTextField.text = @"http://www.baidu.com";
}

- (IBAction)favoritesBtnAction:(UIButton *)sender {
    FavoritesVC *favoritesVC = [[FavoritesVC alloc]init];
    [self presentViewController:favoritesVC animated:YES completion:nil];
}

- (IBAction)gotoBtnAction:(UIButton *)sender {
    [self reloadWebView];
    [_URLTextField resignFirstResponder];
}

- (void)reloadWebView
{
    NSString *URLString = _URLTextField.text;
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [_WebView loadRequest:request];
}

#pragma mark - self.view
//将要显示self.view
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"===%s===",__func__);
}
//已经显示self.view
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"===%s===",__func__);
}
//self.view将要消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"===%s===",__func__);
}
//self.view已经消失
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"===%s===",__func__);
}

@end
