//
//  AIConfigModel.h
//  AI联系人
//
//  Created by 艾泽鑫 on 15/9/7.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIConfigModel : UIView
@property(nonatomic,assign,getter = isRember)BOOL *remember;
@property(nonatomic,assign,getter=isAutoLogin)BOOL *autoLogin;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)configModelWithDict:(NSDictionary*)dict;
@end
