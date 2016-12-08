//
//  AIParentViewController.m
//  AIweichat
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIParentViewController.h"

#define Mainsize ([[UIScreen mainScreen]bounds].size)

@interface AIParentViewController ()

@end

@implementation AIParentViewController

/**
 *  创建左右按钮
 *
 *  @param imageName 图片名字
 *  @param tword     方向left or 右
 */
-(void)createLeftButton:(NSString *)imageName andWith:(BTNDIRECTION )btnDirection{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(onLeftButtonClick:)];
    if (btnDirection == BTNDIRECTION_LEFT) {
        self.navigationItem.leftBarButtonItem = item;
//        item.tag = -1;
    }else{
        self.navigationItem.rightBarButtonItem = item;
//        item.tag = -2;
    }
}
/**
 *子类重写点击事件响应
 */
-(void)onLeftButtonClick:(UIButton*)btn{
    
}

@end
