//
//  AppDelegate.m
//  UIApplicationDelegateDemo
//
//  Created by qingyun on 15/11/6.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序界面显示之前调用的最后一个方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //获取屏幕的尺寸
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    UIWindow *window = [[UIWindow alloc] initWithFrame:screenBounds];
    //创建的window的hidden属性默认为yes
    window.hidden = NO;
    //window的背景颜色为nil
    window.backgroundColor = [UIColor redColor];
    _window = window;
    NSLog(@"应用程序界面显示之前调用的最后一个方法");
    // Override point for customization after application launch.
    return YES;
}

//将要变为未激活
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"将要变为未激活");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//将要进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"将要进入后台");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//将要进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"将要进入前台");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//已经变成激活
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"已经变成激活");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//将要销毁应用程序
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"将要销毁应用程序");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
