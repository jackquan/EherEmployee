//
//  Store_Modal.h
//  XZD
//
//  Created by sysweal on 15/11/4.
//  Copyright © 2015年 sysweal. All rights reserved.
//

#import "Organization_Modal.h"

@interface Store_Modal : Organization_Modal <NSCoding>

@property(nonatomic,strong) NSString    *address;
@property(nonatomic,strong) NSString    *addressId;
@property(nonatomic,strong) NSString    *linkman;
@property(nonatomic,strong) NSString    *linktel;


@end
