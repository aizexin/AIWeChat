//
//  AIUITableViewController.m
//  AIQQ联系人
//
//  Created by qianfeng on 15/8/21.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIaddressBookController.h"
#import "AIFriendsModel.h"
#import "AIQQGroupsModel.h"
#import "AIFriendCellView.h"
#import "AIHeaderCellView.h"
#import "AIChatController.h"
#import "AIDefine.h"
#import "AIDefine.h"
@interface AIaddressBookController ()<UITableViewDelegate,AIHeaderCellViewDelegate>
@property(nonatomic, strong)NSMutableArray *qqGroups;
@end
@implementation AIaddressBookController
-(void)viewDidLoad{
    self.title = @"通讯录";
}
#pragma mark -数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.qqGroups.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AIQQGroupsModel *groupModel = self.qqGroups[section];
    AILog(@"isopen = %d",groupModel.isOpen);
    if (groupModel.isOpen) {
        return groupModel.friends.count;
    }else{
        return 0;
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1创建cell
    AIFriendCellView *cell = [AIFriendCellView FriendCellWithTableView:tableView];
    //2传递模型
    AIQQGroupsModel *groupModel = self.qqGroups[indexPath.section];
    AIFriendsModel *friendsmodel = groupModel.friends[indexPath.row];
    cell.friendData = friendsmodel;
    //3返回cell
    return cell;
}
#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
#warning mark -暂时直接跳转到chat
    AIChatController *charController = [[AIChatController alloc]init];
    
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:charController animated:YES];
}
/**
 *  每行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
#pragma mark -AIHeaderCellViewDelegate
-(void)headerCellViewDidClick:(UIButton *)btn{
    AILog(@"点击到");
    [self.tableView reloadData];
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //创建cell
    AIHeaderCellView *headerCell = [AIHeaderCellView headerCellViewWithTableView:tableView];
    headerCell.delegate = self;
    //传递模型
    headerCell.groupData = self.qqGroups[section];
    //返回模型
    return headerCell;
}
/*#pragma mark -隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}*/
#pragma mark -懒加载
-(NSMutableArray *)qqGroups{
    if (!_qqGroups) {
        NSString *fullpath = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:fullpath];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            AIQQGroupsModel *itemGroup = [AIQQGroupsModel qqGroupsWithDict:dict];
            [arrayM addObject:itemGroup];
        }
        _qqGroups = arrayM;
    }
    return _qqGroups;
}

@end
