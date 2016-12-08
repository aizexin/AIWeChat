//
//  AIFriendCell.h
//  AIQQ联系人
//
//  Created by 艾泽鑫 on 15/8/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AIFriendsModel;
@interface AIFriendCellView : UITableViewCell
@property(nonatomic, strong)AIFriendsModel *friendData;
+(instancetype) FriendCellWithTableView:(UITableView*)tableview;
@end
