//
//  WebVC.h
//  ASimpleWebView
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *URLTextField;
@property (nonatomic, strong) NSString *tempString;
@end
