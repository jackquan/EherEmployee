//
//  ExDataParser.h
//  XZD
//
//  Created by sysweal on 14/12/2.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataParser.h"
#import "Base_Modal.h"
#import "Version_Modal.h"

@interface DataParser (ExDataParser)

//解析数据
+(NSArray *) parserData:(NSString *)opKey data:(NSData *)data;


@end

@interface ExDataParser : NSObject

@end