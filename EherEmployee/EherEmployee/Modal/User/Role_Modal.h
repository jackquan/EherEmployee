//
//  LCRole_DataModal.h
//  XZD
//
//  Created by LcGero on 15/10/31.
//  Copyright © 2015年 sysweal. All rights reserved.
//

#import "User_Modal.h"
#import "Employee_Modal.h"

@interface Role_Modal : User_Modal

//账号
@property (strong, nonatomic) NSString          *account;
@property (strong, nonatomic) NSString          *storeCode;
@property (strong, nonatomic) NSString          *storeName;
@property (strong, nonatomic) NSMutableArray    *allEmployeeArr;//所有员工
@property (strong, nonatomic) NSMutableArray    *allPayArr; //支付方式Arr
@property (strong, nonatomic) NSMutableArray    *allPostArr;//岗位


@end
