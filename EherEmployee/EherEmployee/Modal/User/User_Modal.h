//
//  LCUser_DataModal.h
//  XZD
//
//  Created by LcGero on 15/10/31.
//  Copyright © 2015年 sysweal. All rights reserved.
//

#import "Base_Modal.h"
#import "Image_Modal.h"

@interface User_Modal : Base_Modal

@property (strong, nonatomic) NSString        *sex;
@property (assign, nonatomic) int             sexType;//0女，1男
@property (strong, nonatomic) NSString        *phone;

@property (strong, nonatomic) NSString        *birthYear;
@property (strong, nonatomic) NSString        *birthDay;
@property (assign, nonatomic) int             birthDayType;//0-阳历 1-农历

@property (strong, nonatomic) Image_Modal     *imgModal;
@property (strong, nonatomic) NSString        *fristChar;
@property (strong, nonatomic) NSString        *nickName;    //昵称

@end
