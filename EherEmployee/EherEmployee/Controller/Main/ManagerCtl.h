//
//  ViewController.h
//  XZD
//
//  Created by sysweal on 14/11/14.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Template.h"
#import "RequestCon.h"
#import "TabBarControllerConfig.h"
#import "Role_Modal.h"

@interface ManagerCtl : BaseUIViewController <UIWebViewDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic)   CYLTabBarController         *mainCtl;

@property (weak, nonatomic)   IBOutlet UIWebView    *webView;





//共用的
+(ManagerCtl *) defaultManagerCtl;


//设置登录信息 
+(void) setRoleInfo:(Role_Modal *)modal;

//获取登录信息
+(Role_Modal *) getRoleInfo;


//获取Nav
+(UINavigationController *) getNav:(UIViewController *)ctl barHidden:(BOOL)barHidden;

//登出
-(void) loginOff;

+ (UINavigationController *)getCurrentNav;



@end

