//
//  Version_Modal.h
//  XZD
//
//  Created by sysweal on 15/3/18.
//  Copyright (c) 2015年 sysweal. All rights reserved.
//

#import "Base_Modal.h"

@interface Version_Modal : Base_Modal

@property(nonatomic,strong) NSString    *versionCode_;
@property(nonatomic,strong) NSString    *path_;

-(BOOL) isNewVersion;
@end
