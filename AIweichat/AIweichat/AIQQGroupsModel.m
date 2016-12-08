//
//  AIQQGroups.m
//  AIQQ联系人
//
//  Created by qianfeng on 15/8/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIQQGroupsModel.h"
#import "AIFriendsModel.h"
@interface AIQQGroupsModel ()

@end

@implementation AIQQGroupsModel

-(instancetype)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *itemdict in self.friends ) {
            AIFriendsModel *friend = [AIFriendsModel friendWithDict:itemdict];
            [arrayM addObject:friend];
        }
        self.friends = arrayM;
    }
    return self;
}
+(instancetype)qqGroupsWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
@end
