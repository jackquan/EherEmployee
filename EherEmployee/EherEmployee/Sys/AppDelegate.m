//
//  AppDelegate.m
//  ERP
//
//  Created by Luoqw on 2017/3/21.
//  Copyright © 2017年 eher. All rights reserved.
//

#import "AppDelegate.h"

#import "Common.h"
#import "Config.h"
#import "MyLog.h"
#import "RequestCon.h"
#import "ManagerCtl.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //将需要copy的文件copy到沙盒中
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [Common getSandBoxPath:DB_FileName];
    if( ![fileManager fileExistsAtPath:filePath] )
    {
        //不存在，则拷入手机中
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSData *data = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",[mainBundle resourcePath],DB_FileName]];
        [data writeToFile:[Common getSandBoxPath:DB_FileName] atomically:YES];
    }
    
    //设置一下基础地址
    [RequestCon setBaseURL:[Config getServiceAddr]];
    
    //设置一下Cookie
    [RequestCon setCookieInfo:[NSString stringWithFormat:@"DEVICEID=%@;termUserCode=3",[Common getDeviceInditify]]];
    
    [self setShowAppearence];

    [self setShareSDK];

    
    return YES;
}

-(void) setShowAppearence
{
    [[UITextField appearance] setTintColor:Color_Default];
    [[UITextView appearance] setTintColor:Color_Default];
}

-(void) setShareSDK
{
    [ShareSDK registerApp:@"d5bba7ae46d4"
     
          activePlatforms:@[
                            //                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformSubTypeWechatSession),
                            @(SSDKPlatformSubTypeWechatTimeline),
                            //                            @(SSDKPlatformTypeQQ),
                            //                            @(SSDKPlatformSubTypeQZone),
                            @(SSDKPlatformSubTypeQQFriend)
                            ]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wxfa3671683e460746"
                                       appSecret:@"0f3b27322fed837be96de0db04a2b450"];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1105015968"
                                      appKey:@"x5nxj4i2MLtwXgvo"
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
