//
//  AICellModel.h
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    AICellModelMe = 0,
    AICellModelOther
}AICellModelType;
@interface AICellDataModel : UIView
@property(nonatomic, copy)NSString *text;

@property(nonatomic, copy)NSString *time;
@property(nonatomic, assign)AICellModelType type;
@property(nonatomic,assign)BOOL isHiddenTime;
-(instancetype) initWithDict:(NSDictionary*)dict;
+(instancetype) cellModelWithDict:(NSDictionary*)dict;
@end
