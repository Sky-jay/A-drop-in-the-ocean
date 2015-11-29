//
//  FavoritesVC.m
//  ASimpleWebView
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "FavoritesVC.h"
#import "WebVC.h"

@interface FavoritesVC ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *detailTexts;
@property (nonatomic, strong) NSMutableArray *texts;
@property (nonatomic, strong) NSString *selectString;

@end

@implementation FavoritesVC
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _texts = [[NSMutableArray alloc]initWithObjects:@"百度", @"腾讯", @"中关村", nil];
    _detailTexts = [[NSMutableArray alloc]initWithObjects:@"http://www.baidu.com", @"http://www.qq.com", @"http://www.zol.com",nil];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}
- (IBAction)goBackBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveBtnAction:(UIButton *)sender {
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _texts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = _texts[indexPath.row];
    cell.detailTextLabel.text = _detailTexts[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectStr = _detailTexts[indexPath.row];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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

- (void)dealloc
{
    NSLog(@"===%s===",__func__);
}

@end
