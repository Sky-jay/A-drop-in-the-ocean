//
//  ViewController.m
//  SomePopUp
//
//  Created by qingyun on 15/11/29.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"
#import "AlertControllerVC.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *VCs;
@end

@implementation ViewController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    _VCs = @[@"AlertControllerVC", @"AlertViewVC", @"ActionSheetVC"];
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _VCs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _VCs[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *VC = [NSClassFromString(_VCs[indexPath.row]) new];
    //一定要注意navigationController进行压栈操作时，UIAlertControllerVC并不能被成功调用，因为系统有UIAlertController的视图控制器。⭐️⭐️⭐️
//    UIViewController *TestVC = [UIAlertControllerVC new];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
