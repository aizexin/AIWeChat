//
//  AICellViewTableViewCell.h
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AICellDataModel,AICellFrameModel;
@interface AICellView : UITableViewCell
-(instancetype) initWithCellModel:(AICellFrameModel*)cellModel;
/**时间*/
@property(nonatomic, weak)UILabel *timeLabel;
/**聊天对话框*/
@property(nonatomic, weak)UIButton *chatBtn;
/**头像*/
@property(nonatomic, weak)UIImageView *iconImageView;
/**接受模型*/
@property(nonatomic,strong)AICellDataModel *cellModel;
@end
