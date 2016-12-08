//
//  AIConfigModel.m
//  AI联系人
//
//  Created by 艾泽鑫 on 15/9/7.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIConfigModel.h"

@implementation AIConfigModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)configModelWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
