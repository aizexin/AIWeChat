//
//  AIQQGroups.h
//  AIQQ联系人
//
//  Created by qianfeng on 15/8/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIQQGroupsModel : NSObject
@property (nonatomic , copy)NSString *name;
@property(nonatomic ,assign)NSNumber *online;
@property(nonatomic ,strong)NSArray *friends;
@property(nonatomic,assign,getter = isOpen )BOOL open;
-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)qqGroupsWithDict:(NSDictionary*)dict;
@end
