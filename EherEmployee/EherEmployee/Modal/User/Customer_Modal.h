//
//  LQWCustomer_DataModal.h
//  XZD
//
//  Created by luoqingwu on 15/10/31.
//  Copyright © 2015年 sysweal. All rights reserved.
//

#import "User_Modal.h"
#import "Employee_Modal.h"

@interface Customer_Modal : User_Modal

@property (assign, nonatomic) BOOL          bMember;//是否会员
@property (strong, nonatomic) Base_Modal    *sourceModal;


@property(nonatomic,strong) NSArray     *cardArr;//卡包
@property(nonatomic,strong) NSString    *memberPoint;//会员积分

/** 欠款金额*/
@property(nonatomic,strong) NSString    *arrearAmount;
/** 定金*/
@property(nonatomic,strong) NSString    *earnestAmount;

//专属顾问
@property (strong, nonatomic) NSArray       *advisorArr;
@property (strong, nonatomic) NSString      *advisorStr;
//所属门店
@property (strong, nonatomic) Base_Modal    *openStoreModal;
//最近消费日期
@property (strong, nonatomic) NSString      *lastServeDate;


@end
