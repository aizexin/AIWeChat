//
//  AIFriends.h
//  AIQQ联系人
//
//  Created by qianfeng on 15/8/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIFriendsModel : NSObject
@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *intro;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign, getter = isVip)NSNumber *vip;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendWithDict:(NSDictionary *)dict;

@end
