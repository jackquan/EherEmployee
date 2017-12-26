//
//  LCPermission_DataModal.h
//  XZD
//
//  Created by LcGero on 15/10/31.
//  Copyright © 2015年 sysweal. All rights reserved.
//

#import "Base_Modal.h"

@interface Permission_Modal : Base_Modal

@property(nonatomic, strong) NSString               *haveRight;
@property(nonatomic, strong) NSMutableArray         *subPermissions;

@end
