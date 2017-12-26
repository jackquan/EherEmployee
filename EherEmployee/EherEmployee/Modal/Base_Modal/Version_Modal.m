//
//  Version_Modal.m
//  XZD
//
//  Created by sysweal on 15/3/18.
//  Copyright (c) 2015年 sysweal. All rights reserved.
//

#import "Version_Modal.h"
#import "Config.h"

@implementation Version_Modal

@synthesize versionCode_,path_;

-(BOOL) isNewVersion
{
    BOOL bHaveNewVersion = NO;
    if( self.versionCode_ && [self.versionCode_ compare:Version options:NSNumericSearch] != NSOrderedSame ){
        NSLog(@"发现新版本");
        bHaveNewVersion = YES;
    }
    return bHaveNewVersion;
}
@end
