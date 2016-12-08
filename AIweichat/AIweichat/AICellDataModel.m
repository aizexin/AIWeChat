//
//  AICellModel.m
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AICellDataModel.h"

@interface AICellDataModel()


@end
@implementation AICellDataModel
#pragma mark 通过KVC设置数据
-(instancetype) initWithDict:(NSDictionary*)dict{
    [self setValuesForKeysWithDictionary:dict];

    return self;
}
+(instancetype) cellModelWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
@end
