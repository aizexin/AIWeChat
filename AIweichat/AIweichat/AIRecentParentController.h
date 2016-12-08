//
//  AIRecentParentController.h
//  AIweichat
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIDefine.h"


@interface AIRecentParentController : UITableViewController
/**
 *  创建左右按钮
 *
 *  @param imageName 图片名字
 *  @param tword     方向left or 右
 */
-(void)createLeftButton:(NSString *)imageName andWith:(BTNDIRECTION )btnDirection;
/**
 *  创建导航的标题
 *
 *  @param title 标题的名字
 */
-(void)createTitle:(NSString *)title;
@end
