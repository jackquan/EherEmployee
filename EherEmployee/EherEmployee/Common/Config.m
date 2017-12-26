//
//  Config.m
//  XZD
//
//  Created by sysweal on 14/11/24.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import "Config.h"
#import "Common.h"

@implementation Config

//获取应用服务器地址
+(NSString *) getServiceAddr
{
    NSString *baseServiceAddr = [BaseConfig getDBValueByKey:Config_Key_ServiceAddr];
    if( !baseServiceAddr || [baseServiceAddr isEqualToString:@""] ){
        baseServiceAddr = ServiceAddr_Default;
    }
    NSLog(@"%@", baseServiceAddr);
    return baseServiceAddr;
}

//获取品牌code
+ (NSString *)getServiceBrandCode
{
    NSString *baseBrand = [BaseConfig getDBValueByKey:Config_Key_Brand];
    if( !baseBrand || [baseBrand isEqualToString:@""] ){
        baseBrand = ServiceBrand_Default;
    }
    NSLog(@"%@", baseBrand);
    return baseBrand;
}

@end
