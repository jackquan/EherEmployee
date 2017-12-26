//
//  Config.h
//  XZD
//
//  Created by sysweal on 14/11/24.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseCommon.h"

#define Version                     @"1.0.0"
#define Version_ERP     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define SetService_PWD              @"123abcABC"
#define Config_Key_ServiceAddr      @"service_addr"
#define Config_Key_Brand            @"service_brand"

#define B_Production 1

#if B_Production
    //生产
//    #define ServiceAddr_Default          @"http://oss.eher365.com:8080/eher"

    //外网测试
//    #define ServiceAddr_Default         @"http://120.76.246.10:8080/eher"
    //演示环境
    #define ServiceAddr_Default         @"http://192.168.40.135:8080/erp/api"

#else
    //测试
    #define ServiceAddr_Default         @"http://alongch.imwork.net:5588/erp/api"

#endif

#define ServiceBrand_Default            @""

#define ShowModelCache_Default      @"0"
#define AdminModelCache_Default     @"0"
#define PushAudio_Default           @"1"
#define VideoCache_Default          @"0"

#define isHaveGuidePage             YES

//登录成功后，需要重新登录的时间
#define Mgr_ReLogin_Seconds         (30*24*60*60)

//主题颜色 (27bfaf)
#define Color_Default               [UIColor colorWithRed:39.0/255 green:191.0/255 blue:175.0/255 alpha:1.000]

//主题颜色 (72c0e9)
#define Color_Second               [UIColor colorWithRed:0.447 green:0.753 blue:0.914 alpha:1.000]

//背景色 (F1F4F4)
#define Color_Background_Default    [UIColor colorWithRed:0.945 green:0.957 blue:0.957 alpha:1.000]

//主要字体颜色
#define Color_Text_Main             [UIColor colorWithWhite:0.200 alpha:1.000]

//次要字体颜色
#define Color_Default_Gray          [UIColor colorWithWhite:0.400 alpha:1.000]

#define Color_Default_Off           [UIColor colorWithRed:133.0/255 green:133.0/255 blue:133.0/255 alpha:1]

#define Default_Null_Str            @"--"

#define Image_Scale                 (75.0/36.0)


@interface Config : NSObject

//获取应用服务器地址
+(NSString *) getServiceAddr;

//获取品牌code
+ (NSString *)getServiceBrandCode;

@end
