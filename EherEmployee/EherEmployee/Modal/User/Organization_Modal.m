//
//  Organization_Modal.m
//  XZD
//
//  Created by LcGero on 16/5/25.
//  Copyright © 2016年 sysweal. All rights reserved.
//

#import "Organization_Modal.h"

@implementation Organization_Modal

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.parentCode forKey:@"parentCode"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.parentCode = [aDecoder decodeObjectForKey:@"parentCode"];
    }
    return self;
}

@end
