//
//  AICreateBar.m
//  AIweichat
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AICreateBar.h"
#import "AIMyConfigController.h"
#import "AINearbyPersonController.h"
#import "AIaddressBookController.h"
#import "AIrecentPersonController.h"
@implementation AICreateBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(UITabBarController *)createNavigtionTabBar{
    AICreateBar *createBar = [[AICreateBar alloc]init];
    return [createBar createNavigtionTabBar];
}
-(UITabBarController *)createNavigtionTabBar{
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    AIRecentPersonController *recentP = [[AIRecentPersonController alloc]init];
    
    AIMyConfigController *myConfig = [[AIMyConfigController alloc]init];
    AINearbyPersonController *nearbyPerson = [[AINearbyPersonController alloc]init];
    AIaddressBookController *addressBook = [[AIaddressBookController alloc]init];
    
    NSArray *array = @[
                       [[UINavigationController alloc]initWithRootViewController:recentP],
                       [[UINavigationController alloc]initWithRootViewController:addressBook],
                       [[UINavigationController alloc]initWithRootViewController:nearbyPerson],
                       [[UINavigationController alloc]initWithRootViewController:myConfig]
                       ];
    tabVC.viewControllers = array;
    //设置背景颜色
    tabVC.tabBar.barTintColor = [UIColor greenColor];
    //设置镂空颜色
    tabVC.tabBar.tintColor = [UIColor yellowColor];
    //设置透明度
    tabVC.tabBar.translucent = NO;
    //背景图
    tabVC.tabBar.backgroundImage = [UIImage imageNamed:@"title_bg"];
    //设置标题
    //    tabVC.title  = @"ming";
    //名字array
    NSArray *nameArray = @[@"最近联系人",@"通讯录",@"附近的人",@"我的设置"];
    for (int i = 0; i < nameArray.count; i++) {
        UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"tab_%d",i]]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"tab_c%d",i]]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        UINavigationController *VC = tabVC.viewControllers[i];
       
        VC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nameArray[i] image:image selectedImage:selectedImage];
        [VC.navigationBar setBackgroundImage:[UIImage imageNamed:@"title_bg"] forBarMetrics:(UIBarMetricsDefault)];
    }
    return tabVC;
//    self.window.rootViewController = tabVC;
}

@end
