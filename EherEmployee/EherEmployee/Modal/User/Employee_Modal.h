//
//  Employee_Modal.h
//  XZD
//
//  Created by sysweal on 15/11/3.
//  Copyright © 2015年 sysweal. All rights reserved.
//

#import "User_Modal.h"

@interface Employee_Modal : User_Modal <NSMutableCopying>

@property (assign, nonatomic) BOOL    isSign;//签到

@property (strong, nonatomic) Base_Modal    *postInfo;//职位

@end
