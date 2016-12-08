//
//  AIRecentParentController.m
//  AIweichat
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIRecentParentController.h"
#define Mainsize ([[UIScreen mainScreen]bounds].size)

@interface AIRecentParentController ()

@end

@implementation AIRecentParentController

/**
 *  创建左右按钮
 *
 *  @param imageName 图片名字
 *  @param tword     方向left or 右
 */
-(void)createLeftButton:(NSString *)imageName andWith:(BTNDIRECTION )btnDirection{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(onLeftButtonClick:)];
    if (btnDirection == BTNDIRECTION_LEFT) {
        self.navigationItem.leftBarButtonItem = item;
        //        item.tag = -1;
    }else{
        self.navigationItem.rightBarButtonItem = item;
        //        item.tag = -2;
    }
}
/**
 *子类重写点击事件响应
 */
-(void)onLeftButtonClick:(UIButton*)btn{
    
}
-(void)createTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 0, Mainsize.width-200, 64);
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = label;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
