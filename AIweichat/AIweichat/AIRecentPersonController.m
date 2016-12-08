//
//  AIrecentPerson.m
//  AIweichat
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIRecentPersonController.h"
#import "AIRecentCell.h"
#import "AINearbyPersonController.h"
#import "AIDefine.h"
#import "AIaddressBookController.h"

@interface AIRecentPersonController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong ,nonatomic)NSMutableArray *allRecntDatas;
//@property(strong,nonatomic)UITableView *tableView;
@end

@implementation AIRecentPersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTitle:@"最近联系人"];
    
}
#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1创建cell
    static NSString *identifier = @"recentCell";
    AIRecentCell *cell = [[AIRecentCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    //    2得到数据
    cell.dataM = self.allRecntDatas[indexPath.row];
    //    3返回cell
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
//    return [NSString stringWithFormat:@"%ld",indexPath.row];
}
#pragma mark -UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
#warning mark -跳转页面
    AIaddressBookController *contactController = [[AIaddressBookController alloc]init];
    [self.navigationController pushViewController:contactController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
