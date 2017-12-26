//
//  ExRequestCon.m
//  XZD
//
//  Created by sysweal on 14/12/1.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import "ExRequestCon.h"
#import "MD5.h"
#import "ManagerCtl.h"

#define Null_Default    [NSNull null]

@implementation RequestCon (ExReqeustCon)

/******
 
 Login
 
 ******/

//登录
//- (void)doLogin:(NSString *)storeCode accont:(NSString *)account password:(NSString *)password
//{
//    NSDictionary *dic = @{@"storeCode":storeCode?storeCode:@"",@"code":account?account:@"",@"password":password?password:@""};
//    [self startPostRequest:@"doLogin" bodyDic:dic];
//}


/**
 *  BASE
 */

- (void)startPostListRequest:(NSString *)opKey bodyDic:(NSDictionary *)bodyDic
{
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:bodyDic];
    
    mDic[@"page"] = [NSString stringWithFormat:@"%d",self.pageModal_.currentPage_];
    mDic[@"size"] = [NSString stringWithFormat:@"%d",PageSize];
    [self startPostRequest:opKey bodyDic:mDic];
}

- (void)startPostRequest:(NSString *)opKey bodyDic:(NSDictionary *)bodyDic
{
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    dic[@"account"] = [ManagerCtl getRoleInfo].account;
    dic[@"data"]    = bodyDic?bodyDic:[NSDictionary new];
    dic[@"device"]  = [Common getDeviceInditify];
    dic[@"version"] = Version_ERP;
    dic[@"brandCode"]  = [Config getServiceBrandCode];
    
    SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
    NSString *body  = [jsonWriter stringWithObject:dic];
    [super startPostRequest:opKey param:nil body:body];

}

//- (void) startPostRequest:(NSString *)opKey param:(NSString *)param bodyDic:(NSDictionary *)bodyDic
//{
//    NSDictionary *dic = @{@"sys_type":@"ios_iphone",@"version":Version,@"device":@"",@"sessionId":@"",@"account":@"",@"storeId":@"",@"data":bodyDic?bodyDic:[NSDictionary new]};
//    SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
//    NSString * body = [jsonWriter stringWithObject:dic];
//    [super startPostRequest:opKey param:param body:body];
//}

@end

@implementation ExRequestCon

@end
