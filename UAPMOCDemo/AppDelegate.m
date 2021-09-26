//
//  AppDelegate.m
//  UAPMOCDemo
//
//  Created by zhangjunhua on 2021/6/28.
//

#import "AppDelegate.h"
#import <UMCommon/UMCommon.h>
#import <UMAPM/UMCrashConfigure.h>
#import <UMAPM/UMLaunch.h>
#import <UMAPM/UMAPMConfig.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置启动模块自定义函数开始
    [UMLaunch beginLaunch:@"intUmeng"];
    //初始化友盟SDK
    UMAPMConfig* config = [UMAPMConfig defaultConfig];
    config.crashAndBlockMonitorEnable = YES;
    config.launchMonitorEnable = YES;
    config.memMonitorEnable = YES;
    config.oomMonitorEnable = YES;
    config.networkEnable = YES;
    [UMCrashConfigure setAPMConfig:config];
    [UMConfigure initWithAppkey:@"60d93d578a102159db7d44e2" channel:@"App Store"];
    //设置启动模块自定义函数开始
    [UMLaunch endLaunch:@"intUmeng"];
    NSLog(@"UMAPM version:%@",[UMCrashConfigure getVersion]);
    
    //设置预定义DidFinishLaunchingEnd时间
    [UMLaunch setPredefineLaunchType:UMPredefineLaunchType_DidFinishLaunchingEnd];
    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
