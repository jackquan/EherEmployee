//
//  Organization_Modal.h
//  XZD
//
//  Created by LcGero on 16/5/25.
//  Copyright © 2016年 sysweal. All rights reserved.
//

#import "RADataObject.h"

@interface Organization_Modal : RADataObject <NSCoding>

@property (nonatomic, strong) NSString             *parentCode;         //上级组织

@end


