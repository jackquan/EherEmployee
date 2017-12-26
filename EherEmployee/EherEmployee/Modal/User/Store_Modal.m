//
//  Store_Modal.m
//  XZD
//
//  Created by sysweal on 15/11/4.
//  Copyright © 2015年 sysweal. All rights reserved.
//

#import "Store_Modal.h"

@implementation Store_Modal

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.code forKey:@"code"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.code = [aDecoder decodeObjectForKey:@"code"];
    }
    return self;
}

@end
