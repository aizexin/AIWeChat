//
//  AIHeaderCellView.m
//  AIQQ联系人
//
//  Created by qianfeng on 15/8/22.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIHeaderCellView.h"
#import "AIQQGroupsModel.h"


@interface AIHeaderCellView()
@property(nonatomic,weak)UIView *view;
@property(nonatomic,weak)UIButton *btn;
@property(nonatomic,weak)UILabel *label;
@end
@implementation AIHeaderCellView
#pragma mark -获取数据
-(void)setGroupData:(AIQQGroupsModel *)groupData{
    _groupData = groupData;
    [_btn setTitle:groupData.name forState:(UIControlStateNormal)];
    _label.text = [groupData.online stringValue];
}
+(instancetype)headerCellViewWithTableView:(UITableView*)tableview{
    static NSString *indentifier = @"headerCell";
    AIHeaderCellView *headerCell = [tableview dequeueReusableHeaderFooterViewWithIdentifier:indentifier];
    if (!headerCell) {
        headerCell = [[AIHeaderCellView alloc]initWithReuseIdentifier:indentifier];
    }
    return headerCell;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *btn = [[UIButton alloc]init];
        
        UIEdgeInsets edge = UIEdgeInsetsMake(2, 10, 0, 0);
        [btn setContentEdgeInsets:edge];
        [btn setTitleEdgeInsets:edge];
        //设置文字左对齐
        [btn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentLeft)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        //添加背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:(UIControlStateNormal)];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:(UIControlStateHighlighted)];
        //添加图片
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:(UIControlStateNormal)];
        btn.imageView.contentMode = UIViewContentModeCenter;
        //图片不要被切割
         btn.imageView.clipsToBounds = NO;
        _btn = btn;
        [self addSubview:btn];
        
        UILabel *label = [[UILabel alloc] init];
        self.label = label;

        [self addSubview:_label];
        
        //添加点击事件
        [btn addTarget:self action:@selector(btnlistener:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return self;
}


#pragma mark -监听点击事件
-(void)btnlistener:(UIButton*)btn{
     NSLog(@"%d",_groupData.isOpen);
     self.groupData.open = !self.groupData.isOpen;
//    self.btn.imageView trans
    NSLog(@"%d",_groupData.open);
    if([self.delegate respondsToSelector:@selector(headerCellViewDidClick:)]){
        [_delegate headerCellViewDidClick:btn];
    }
    
}
/**
 *  已经被添加到父视图上的时候会调用
 */
-(void)didMoveToSuperview{
    if(self.groupData.isOpen){
        
        self.btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
}
/**
 *  当控件frame改变的时候调用
 */
-(void)layoutSubviews{
    //设置btn frame
    _btn.frame = self.bounds;
//    设置labelframe
    // 1.2添加label
    CGFloat padding = 10;// 间隙
   
    CGFloat labelY = 0;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelW = 150;
    CGFloat labelX = self.bounds.size.width - padding - labelW;
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
