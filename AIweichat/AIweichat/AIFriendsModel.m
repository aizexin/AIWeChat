//
//  AIFriends.m
//  AIQQ联系人
//
//  Created by qianfeng on 15/8/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIFriendsModel.h"

@interface AIFriendsModel ()

@end
@implementation AIFriendsModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
