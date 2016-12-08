//
//  AIFriendCell.m
//  AIQQ联系人
//
//  Created by 艾泽鑫 on 15/8/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIFriendCellView.h"
#import "AIFriendsModel.h"
@implementation AIFriendCellView

+(instancetype) FriendCellWithTableView:(UITableView*)tableview{
    static NSString *identifier = @"friendcell";
    AIFriendCellView *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AIFriendCellView alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
    }
    return cell;
}
-(void)setFriendData:(AIFriendsModel *)friendData{
    UIImage *image = [UIImage imageNamed:friendData.icon];
    self.imageView.image = image;
    self.textLabel.text = friendData.name;
    self.detailTextLabel.text = friendData.intro;
    
    if([friendData.isVip integerValue]){
        [self.textLabel setTextColor:[UIColor redColor]];
    }else{
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
}
@end
