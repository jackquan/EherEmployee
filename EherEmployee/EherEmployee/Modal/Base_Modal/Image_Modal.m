//
//  Image_DataModal.m
//  XZD
//
//  Created by sysweal on 14/12/4.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import "Image_Modal.h"

@implementation Image_Modal

@synthesize url_,imgType_,deviceType,screenType,imgData_,bImageLoad_;

-(void) setDeviceCodeStr:(NSString *)str
{
    _deviceCodeStr = str;
    
    if( [str isEqualToString:@"PAD"] ){
        self.deviceCode = DeviceCode_Pad;
    }else if( [str isEqualToString:@"PHONE"] ){
        self.deviceCode = DeviceCode_Phone_Lager;
    }
}

//获取产品的缩略图
+(Image_Modal *) getThumbImgModal:(NSArray *)arr
{
    Image_Modal *dataModal = nil;
    
    for ( Image_Modal *tmpModal in arr ) {
        if( tmpModal.imgType_ == ImgType_Thumb && tmpModal.deviceCode == DeviceCode_Pad ){
            dataModal = tmpModal;
            break;
        }
    }
    
    //如果小图找不到，则使用大图
    if( !dataModal ){
        for ( Image_Modal *tmpModal in arr ) {
            if( tmpModal.imgType_ == ImgType_Lager && tmpModal.deviceCode == DeviceCode_Pad ){
                dataModal = tmpModal;
                break;
            }
        }
    }
    
    return dataModal;
}

//获取原图url
+(NSURL *) getOriginImageUrl:(NSString *)urlStr
{
    NSString *tempString = [urlStr copy];
    
    if( tempString ){
        NSMutableString *url = [[NSMutableString alloc] initWithString:tempString];
        NSRange rang;
        rang.location = 0;
        rang.length = url.length;
        [url replaceOccurrencesOfString:@"_960x960" withString:@"" options:NSCaseInsensitiveSearch range:rang];
        
        rang.location = 0;
        rang.length = url.length;
        [url replaceOccurrencesOfString:@"_640x640" withString:@"" options:NSCaseInsensitiveSearch range:rang];
        
        rang.location = 0;
        rang.length = url.length;
        [url replaceOccurrencesOfString:@"_160x160" withString:@"" options:NSCaseInsensitiveSearch range:rang];
        tempString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return [NSURL URLWithString:tempString];
}

@end
