//
//  Image_DataModal.h
//  XZD
//
//  Created by sysweal on 14/12/4.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import "Base_Modal.h"
#import <UIKit/UIKit.h>

typedef enum
{
    ImgType_Unknow             = -1,    //未知

    ImgType_Lager              = 1,     //产品大图
    ImgType_Thumb              = 2,     //缩略图
    ImgType_Cover              = 3,     //封面
}ImgType;

typedef enum
{
    ImgDeviceType_IOSPad       = 1,     //IOS平板
    ImgDeviceType_IOSPhone     = 2,     //IOS手机
    ImgDeviceType_AndroidPhone = 3,     //Android手机
}ImgDeviceType;

typedef enum
{
    ScreenType_Null            = 0,

    ScreenType_4               = 1,     //4
    ScreenType_5               = 2,     //5
    ScreenType_6               = 3,     //6
    ScreenType_6p              = 4,     //6plus
    ScreenType_Unknow          = 100,   //未知
}ScreenType;

typedef enum
{
    DeviceCode_Unknow,              //未知
    
    DeviceCode_Pad,                 //设备类型_平板
    DeviceCode_Phone_Smaller,       //设备类型_手机小
    DeviceCode_Phone_Lager,         //设备类型_手机大
}DeviceCode;

typedef enum
{
    ImageSourceType_Exhibition,     //展示位
    ImageSourceType_OnlineLibary,   //线上图片库
    ImageSourceType_Local,          //本地
    ImageSourceType_Unknown,        //未知
}ImageSourceType;


@interface Image_Modal : Base_Modal

@property (nonatomic,strong) NSString      *url_;
@property (nonatomic,strong) NSString      *absoluteUrl_;  //绝对路径
@property (nonatomic,strong) NSString      *timeStemp;     //时间戳

@property (nonatomic,assign) ImgType         imgType_;
@property (nonatomic,assign) ImageSourceType imgSourceType;
@property (nonatomic,strong) NSString        *deviceCodeStr;
@property (nonatomic,assign) DeviceCode      deviceCode;
@property (nonatomic,assign) ImgDeviceType   deviceType;
@property (nonatomic,assign) ScreenType      screenType;
@property (nonatomic,strong) NSData          *imgData_;
@property (nonatomic,assign) BOOL            bImageLoad_;

//上传进度
@property (nonatomic,assign) double         progress;

//获取产品的缩略图
+(Image_Modal *) getThumbImgModal:(NSArray *)arr;

//获取原图url
+(NSURL *) getOriginImageUrl:(NSString *)urlStr;

@end
