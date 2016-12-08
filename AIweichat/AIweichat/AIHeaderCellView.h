//
//  AIHeaderCellView.h
//  AIQQ联系人
//
//  Created by qianfeng on 15/8/22.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AIQQGroupsModel;

@protocol AIHeaderCellViewDelegate <NSObject>
-(void)headerCellViewDidClick:(UIButton*)btn;
@end

@interface AIHeaderCellView : UITableViewHeaderFooterView

@property(nonatomic, weak)id<AIHeaderCellViewDelegate> delegate;
@property(nonatomic, strong)AIQQGroupsModel *groupData;
+(instancetype)headerCellViewWithTableView:(UITableView*)tableview;
@end
