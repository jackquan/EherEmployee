//
//  EherNavigationController.m
//  ERP
//
//  Created by Luoqw on 2017/3/24.
//  Copyright © 2017年 eheeher. All rights reserved.
//

#import "EherNavigationController.h"
#import "Common.h"

@interface EherNavigationController ()

@end

@implementation EherNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setShadowImage:[UIImage imageNamed:@"nav_bottom_line"]];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    if (self.erpDelegate && [self.erpDelegate respondsToSelector:@selector(navigationController:pushViewController:)]) {
        [self.erpDelegate navigationController:self pushViewController:viewController];
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (self.erpDelegate && [self.erpDelegate respondsToSelector:@selector(popViewControllerForNavigationController:)]) {
        [self.erpDelegate popViewControllerForNavigationController:self];
    }
    return [super popViewControllerAnimated:animated];
}

//获取Nav
+ (EherNavigationController *)getNav:(UIViewController *)ctl
                         barHidden:(BOOL)barHidden {
    EherNavigationController *nav =
    [[EherNavigationController alloc] initWithRootViewController:ctl];
    nav.navigationBarHidden = barHidden;
    
    return nav;
}

@end
