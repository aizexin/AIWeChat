//
//  AICellViewTableViewCell.m
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AICellView.h"
#import "AICellDataModel.h"
#import "AICellFrameModel.h"
#import "UIImage+resizing.h"
#import "AIDefine.h"
#define EdgInsertWith 20
@interface AICellView()


@end

@implementation AICellView

#pragma mark - 初始化的时候自定义控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    AILog(@"ssss");
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    UILabel *timelabe = [[UILabel alloc]init];
    [timelabe setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    timelabe.textAlignment = NSTextAlignmentCenter;
    [timelabe setFont:AITimeFont];
    _timeLabel = timelabe;
    
    
    UIButton *chatbtn = [[UIButton alloc]init];
    [chatbtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [chatbtn.titleLabel setFont:AIChatFont];
    chatbtn.titleLabel.numberOfLines = 0;
     //设置按钮内边距
    chatbtn.contentEdgeInsets = UIEdgeInsetsMake(EdgInsertWith, EdgInsertWith, EdgInsertWith, EdgInsertWith);
    _chatBtn = chatbtn;
    
    UIImageView *iconimageview = [[UIImageView alloc]init];
    _iconImageView = iconimageview;
    
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_chatBtn];
    [self.contentView addSubview:_iconImageView];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
   
    
    
    return self;
}
#pragma mark 设置数据
-(instancetype) initWithCellModel:(AICellFrameModel*)cellModel{
    
    [self settingData:cellModel.itemData];
    [self settingFrame:cellModel];
    return self;
}

- (void)settingData:(AICellDataModel*)celldata{
    self.timeLabel.text = celldata.time;
    [_chatBtn setTitle:celldata.text forState:(UIControlStateNormal)];
   
    if (celldata.type == AICellModelMe) {
         //头像图片
        UIImage *iconMe = [UIImage imageNamed:@"me"];
        _iconImageView.image = iconMe;
        //btn图片
        UIImage *chatMeNor = [[UIImage alloc] resizingModeStretch:@"chat_send_nor"];
        [_chatBtn setBackgroundImage:chatMeNor forState:(UIControlStateNormal)];
    }else if (celldata.type == AICellModelOther){
        UIImage *iconOther = [UIImage imageNamed:@"other"];
        _iconImageView.image = iconOther;
        //btn图片
        
        UIImage *chatOtherNor = [[UIImage alloc] resizingModeStretch:@"chat_recive_nor"];
        [_chatBtn setBackgroundImage:chatOtherNor forState:(UIControlStateNormal)];
    }
}
#pragma mark -设置frame
- (void)settingFrame:(AICellFrameModel*)cellFrame{
 
    _timeLabel.frame = CGRectMake(0, cellFrame.timeF.origin.y, cellFrame.timeF.size.width, cellFrame.timeF.size.height);
    _chatBtn.frame = cellFrame.chatF;
    _iconImageView.frame = cellFrame.iconF;
}


@end
