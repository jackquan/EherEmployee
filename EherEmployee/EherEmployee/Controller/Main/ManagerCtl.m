//
//  ViewController.m
//  XZD
//
//  Created by sysweal on 14/11/14.
//  Copyright (c) 2014年 sysweal. All rights reserved.
//


#import "ManagerCtl.h"

static ManagerCtl *shareMgrCtl;
static Role_Modal *roleModal;

@interface ManagerCtl ()

@end

@implementation ManagerCtl

@synthesize webView, mainCtl;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    shareMgrCtl = self;
    
    [ManagerCtl setupNavBarTheme];
    [ManagerCtl setupBarButtonItemTheme];
    
    webView.delegate = self;
    [webView
     loadRequest:[NSURLRequest
                  requestWithURL:[NSURL fileURLWithPath:
                                  [BaseCommon getResourcePath:
                                   @"qdy.html"]]]];
  
}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)web {
    double seconds = 3.0;
#if TARGET_IPHONE_SIMULATOR
    seconds = 0.2;
#endif
    
    dispatch_time_t time =
    dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^(void) {
        [webView removeFromSuperview];
        webView = nil;
        
        
        

        
    });

}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)viewController;
        
    }
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)viewController;
        
    }
}

- (UIControl *)getCurrentTabBarButton:(UITabBarController *)tabBarController
{
    /*
     打印tabBarController.tabBar.subviews
     "<_UITabBarBackgroundView: 0x7fddb21236e0; frame = (0 0; 375 49); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fddb21297d0>>",
     "<UITabBarButton: 0x7fddb23bb500; frame = (2 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb2130880>>",
     "<UITabBarButton: 0x7fddb217e1a0; frame = (96 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb217eec0>>",
     "<UITabBarButton: 0x7fddb2184700; frame = (190 1; 89 48); opaque = NO; layer = <CALayer: 0x7fddb2184e20>>",
     "<UITabBarButton: 0x7fddb21893c0; frame = (283 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb2189b60>>",
     "<UIImageView: 0x7fddb217ea70; frame = (0 -0.5; 375 0.5); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fddb219fa40>>"
     */
    NSMutableArray *tabBarButtons = [NSMutableArray array];
    for (UIView *view in tabBarController.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtons addObject:view];
        }
    }
    UIControl *control = [tabBarButtons objectAtIndex:tabBarController.selectedIndex];
    return control;
}

- (void)tabBarButtonClick:(UIControl *)control
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"transform.scale";
    keyAnimation.values = @[@1.0, @1.1, @0.9, @1.0];
    keyAnimation.duration = 0.3;
    keyAnimation.calculationMode = kCAAnimationCubic;
    [control.layer addAnimation:keyAnimation forKey:nil];
    /*
     打印control的子视图
     "<UITabBarSwappableImageView: 0x7fd7ebc52760; frame = (32 5.5; 25 25); opaque = NO; userInteractionEnabled = NO; tintColor = UIDeviceWhiteColorSpace 0.572549 1; layer = <CALayer: 0x7fd7ebc52940>>",
     "<UITabBarButtonLabel: 0x7fd7ebc4f360; frame = (29.5 35; 30 12); text = '\U8d2d\U7269\U8f66'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fd7ebc4e090>>" a
     */
//    for (UIView *imageView in control.subviews) {
//        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
//            
//        }
//    }
}

- (void)removeTopViewController:(UINavigationController *)nav
{
    NSMutableArray *viewCtls = [NSMutableArray arrayWithObject:[nav.viewControllers lastObject]];
    nav.viewControllers = viewCtls;
}

//登出
- (void)loginOff {
    
    
}

//共用的
+ (ManagerCtl *)defaultManagerCtl {
    return shareMgrCtl;
}



//设置登录信息
+(void) setRoleInfo:(Role_Modal *)modal
{
    roleModal = modal;
}

//获取登录信息
+(Role_Modal *) getRoleInfo
{
    return roleModal;
}


//获取Nav
+ (UINavigationController *)getNav:(UIViewController *)ctl
                         barHidden:(BOOL)barHidden {
    EherNavigationController *nav =
    [[EherNavigationController alloc] initWithRootViewController:ctl];
    nav.navigationBarHidden = barHidden;
    
    return nav;
}

+ (UINavigationController *)getCurrentNav
{
    return [ManagerCtl defaultManagerCtl].mainCtl.navigationController;
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    //1、取出导航栏
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //2、设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19];
    textAttrs[NSForegroundColorAttributeName] = [Common getColor:@"333333"];
    [navBar setTitleTextAttributes:textAttrs];
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_background"] forBarMetrics:UIBarMetricsDefault];
    navBar.tintColor = [Common getColor:@"333333"];        //返回键箭头白色
    
    [navBar setBackgroundImage:[self imageWithColor:Color_Background_Default] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    [navBar setBarTintColor:Color_Background_Default];
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  设置导航栏按钮的主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    textAttrs[NSForegroundColorAttributeName] = Color_Default;
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableAttrs = [NSMutableDictionary dictionary];
    disableAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    disableAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableAttrs forState:UIControlStateDisabled];
    
    
}

@end
