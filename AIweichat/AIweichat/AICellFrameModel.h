//
//  AICellFrameModel.h
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define AITimeFont [UIFont systemFontOfSize:8]
#define AIChatFont [UIFont systemFontOfSize:18]
@class AICellDataModel;
@interface AICellFrameModel : UIView
@property(nonatomic, strong)AICellDataModel *itemData;
@property(nonatomic, assign)CGRect timeF;
@property(nonatomic, assign)CGRect chatF;
@property(nonatomic, assign)CGRect iconF;
@property(nonatomic, assign)CGFloat cellHight;
@end
