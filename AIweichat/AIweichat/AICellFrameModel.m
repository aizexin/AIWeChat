//
//  AICellFrameModel.m
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AICellFrameModel.h"
#import "AICellDataModel.h"
#define PADDING 10
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface AICellFrameModel()

@end

@implementation AICellFrameModel
- (void)setItemData:(AICellDataModel *)itemData{
    _itemData = itemData;
    
    //设置frame
    [self settingFrame:itemData];
    //求得高度
}

-(void)settingFrame:(AICellDataModel*)data{
    
    //设置时间frame
    
    if (!data.isHiddenTime) {
        CGSize maxsize = CGSizeMake(200, MAXFLOAT);
        NSDictionary *fontDict = @{NSFontAttributeName:AITimeFont};
        CGSize timeSize = [self getStringSize:data.time fontDict:fontDict andMaxSize:maxsize];
        CGFloat timeX = 0;
        CGFloat timeY = PADDING;
        CGFloat timeH = timeSize.height;
        CGFloat timeW = SCREEN_WIDTH;
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
        
    }
    
    
    //设置iconframe
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    CGFloat iconY = CGRectGetMaxY(_timeF) + PADDING ;
    CGFloat iconX = 0;
    if (data.type == AICellModelMe) {
        iconX = SCREEN_WIDTH - iconW - PADDING;
        
    }else{
        iconX = PADDING;
    }
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //设置聊天框的frame
    NSDictionary *fontDict2 = @{NSFontAttributeName:AIChatFont};
    CGSize chatmaxsize = CGSizeMake(200 , MAXFLOAT);
    CGSize chatSize = [self getStringSize:data.text fontDict:fontDict2 andMaxSize:chatmaxsize];
    CGFloat textW = chatSize.width + 40;
    CGFloat textH = chatSize.height + 40;
    CGFloat textX = 0;
    CGFloat textY = CGRectGetMaxY(_timeF) +PADDING;
    if (data.type == AICellModelMe) {
        textX = iconX - textW - PADDING;
    }else{
        textX = PADDING + iconX + iconW;
    }
    _chatF = CGRectMake(textX, textY, textW, textH);
    
    //设置cellhight
    CGFloat maxIconY = CGRectGetMaxY(_iconF);
    CGFloat maxChatY = CGRectGetMaxY(_chatF);
    _cellHight = (maxIconY > maxChatY ? maxIconY : maxChatY) +PADDING;
}

-(CGSize)getStringSize:(NSString *)string fontDict:(NSDictionary*)fonDict andMaxSize:(CGSize)maxSize{
    
    CGSize chatSize = [string boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:fonDict context:nil].size;
    return chatSize;
}
@end
