//
//  ViewController.m
//  TunTuDemo
//
//  Created by qingyun on 15/11/6.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property (weak, nonatomic) IBOutlet UIView *purpleView;
@property (nonatomic) CGRect blueViewFrame;
@property (nonatomic) CGRect orangeViewFrame;
@property (nonatomic) CGRect purpleViewFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _blueView.layer.cornerRadius = 50;
    _orangeView.layer.cornerRadius = 50;
    _purpleView.layer.cornerRadius = 50;
    _blueViewFrame = _blueView.frame;
    _orangeViewFrame = _orangeView.frame;
    _purpleViewFrame = _purpleView.frame;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if ([self isPointInView:touches]) {
        UIView *selectedView = touch.view;
        [UIView animateWithDuration:.3 animations:^{
            selectedView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:nil];
    }else if (touch.tapCount == 2){
        [UIView animateWithDuration:.3 animations:^{
            _blueView.frame = _blueViewFrame;
            _orangeView.frame = _orangeViewFrame;
            _purpleView.frame = _purpleViewFrame;
        } completion:nil];
    }
    
        
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGPoint point = [self getPoint:touches];
    if (CGRectContainsPoint(_blueView.frame, point)) {
        _blueView.center = point;
    }
    if (CGRectContainsPoint(_orangeView.frame, point)) {
        _orangeView.center = point;
    }
    if (CGRectContainsPoint(_purpleView.frame, point)) {
        _purpleView.center = point;
    }
    
    [UIView commitAnimations];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIView *selectedView = touch.view;
    selectedView.transform = CGAffineTransformIdentity;
}

- (BOOL)isPointInView:(NSSet *)touches
{
    CGPoint point = [self getPoint:touches];
    if (CGRectContainsPoint(_blueView.frame, point) || CGRectContainsPoint(_orangeView.frame, point) || CGRectContainsPoint(_purpleView.frame, point)) {
        return YES;
    }
    return NO;
}

- (CGPoint)getPoint:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    return point;
}

@end
