//
//  ERPNavigationController.h
//  ERP
//
//  Created by Luoqw on 2017/3/24.
//  Copyright © 2017年 eheeher. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EherNavigationController;
@protocol ERPNavigationControllerDelegate <NSObject>

- (void)navigationController:(EherNavigationController *)navigationController pushViewController:(UIViewController *)viewController;

@optional
- (void)popViewControllerForNavigationController:(EherNavigationController *)navigationController;

@end

@interface EherNavigationController : UINavigationController

@property (weak, nonatomic) id<ERPNavigationControllerDelegate> erpDelegate;

//获取Nav
+(EherNavigationController *) getNav:(UIViewController *)ctl barHidden:(BOOL)barHidden;

@end
