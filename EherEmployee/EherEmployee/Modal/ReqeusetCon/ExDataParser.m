//
//  ExDataParser.m
//  XZD
//
//  Created by sysweal on 14/12/2.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import "ExDataParser.h"

@implementation DataParser (ExDataParser)

//解析数据
+(NSArray *) parserData:(NSString *)opKey data:(NSData *)data
{
    [MyLog Log:[NSString stringWithFormat:@"parserData opKey=%@",opKey] obj:nil];
    
    NSArray *arr = nil;
    NSDictionary *responseDic = nil;
    NSDictionary *dic = nil;
    NSString *restCode;
    NSString *restMsg;
    
    if( opKey ){
        responseDic = [BaseCommon getDataDic:data];
    }else{
        arr = [NSArray arrayWithObject:data];
    }
    
    if( responseDic ){
        if ([responseDic isKindOfClass:[NSDictionary class]]) {
            restCode = [responseDic objectForKey:@"retCode"];
            restMsg = [responseDic objectForKey:@"retMsg"];
            
            //新接口解析
            if (!restCode && !restMsg) {
                restCode = [responseDic objectForKey:@"code"];
                restCode = [restCode isEqualToString:@"0"]?Request_OK:restCode;
                restMsg = [responseDic objectForKey:@"message"];
            }
            
            dic = [responseDic objectForKey:@"data"];
        }
        
        //拦截版本更新信息
        if ( [restCode isEqualToString:Request_NewVersion] ){
            arr = [self parserVersionInfo:dic];
        } else {
            //公共解析方法
            if ([opKey isEqualToString:@"employeeSign"] ||
                [opKey isEqualToString:@"modifyAppointment"] ||
                [opKey isEqualToString:@"changeAppointStatus"] ||
                [opKey isEqualToString:@"addMember"]
                ) {
                arr = [self parserBaseReturnRestCode:dic];
            }
            
            
        }
        
        
    }
    
    //date:2015-11-17 如果返回成功了，但是arr没有，则赋值一下arr
    if( [restCode isEqualToString:Request_OK] && !arr ){
        arr = [NSMutableArray new];
    }
    
    for ( id obj in arr ) {
        if( [obj isKindOfClass:[Base_Modal class]] ){
            Base_Modal *dataModal = obj;
            dataModal.restCode = restCode;
            dataModal.restMsg = restMsg;
        }
    }
    
    return arr;
}

//公用部分，只需要获取code
+(NSMutableArray *)parserBaseReturnRestCode:(NSDictionary *)dic
{
    NSMutableArray *arr = [NSMutableArray array];
    Base_Modal *modal = [[Base_Modal alloc]init];
    
    [arr addObject:modal];
    
    return arr;
}

//版本信息
+(NSMutableArray *) parserVersionInfo:(NSDictionary *)dic
{
    NSMutableArray *arr = nil;
    
    if( dic ){
        arr = [NSMutableArray new];
        
        Version_Modal *dataModal = [Version_Modal new];
        dataModal.path_ = dic[@"url"];
//        dataModal.des = dic[@"des"];
        dataModal.versionCode_ = dic[@"version"];
        
        [arr addObject:dataModal];
    }
    
    return arr;
}

@end

@implementation ExDataParser

@end

