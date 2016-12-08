//
//  ViewController.m
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/15.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AIChatController.h"
#import "AICellView.h"
#import "AICellDataModel.h"
#import "AICellFrameModel.h"
#import "AIDefine.h"
#import "AIChatView.h"
@interface AIChatController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) UITableView *tableView;
/**数据模型*/
@property(nonatomic, strong)NSMutableArray *dataModels;
@property (strong, nonatomic)  UIView *barView;
@property (retain, nonatomic)  UITextField *inPutTextField;
@property(nonatomic,strong) NSDictionary *autoDict;
@end

@implementation AIChatController
-(NSDictionary *)autoDict{
    if (!_autoDict) {
        NSString *autopath = [[NSBundle mainBundle]pathForResource:@"autoanswer" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:autopath];
        _autoDict = dict;
    }
    return _autoDict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    self.tabBarController.tabBar.userInteractionEnabled = NO;
    self.title = @"与神对话";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //隐藏分割线
    self.tableView.separatorStyle = NO;
    //隐藏滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    //不可被选中
    self.tableView.allowsSelection = NO;
    //设置背景颜色
    [self.tableView setBackgroundColor:[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1]];
    //设置通知中心
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.inPutTextField.delegate = self;
    
}
#pragma mark 添加控件
-(void)createUI{
    //添加
    UITableView *tabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Mainsize.width, Mainsize.height-44)];
    _tableView = tabel;
    [self.view addSubview:_tableView];
    
    AIChatView *V = [[[NSBundle mainBundle]loadNibNamed:@"chatTest" owner:nil options:nil]lastObject];
    CGRect rectV = CGRectMake(0 ,Mainsize.height-44, Mainsize.width, 44);
    V.frame = rectV;
    _barView = V;
    _inPutTextField = V.textInput;
    [self.tabBarController.view addSubview:V];
    [self.view addSubview:V];

   self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.automaticallyAdjustsScrollViewInsets = NO;
    
}

#pragma mark -监听键盘
-(void)keyboardWillChangeFrame:(NSNotification*)notification{
    //    UIKeyboardWillChangeFrameNotification; userInfo = {
    //        UIKeyboardAnimationCurveUserInfoKey = 7;
    //        UIKeyboardAnimationDurationUserInfoKey = "0.25";
    //        UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {320, 253}}";
    //        UIKeyboardCenterBeginUserInfoKey = "NSPoint: {160, 606.5}";
    //        UIKeyboardCenterEndUserInfoKey = "NSPoint: {160, 353.5}";
    //        UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 480}, {320, 253}}";
    //        UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 227}, {320, 253}}";
    //    }}
    //点击的时候整个view往上移动
    NSDictionary *dict = notification.userInfo;
    CGRect keyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    
    CGFloat viewy = keyboardY - self.view.frame.size.height;
    self.view.transform = CGAffineTransformMakeTranslation(0, viewy);
    
}
#pragma mark -弹回键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //弹回键盘的时候整个view移动回来
    [self.inPutTextField endEditing:NO];
}
#pragma mark -监听send按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField;{
    AILog(@"点击send");
    [self addModelWithInput:textField.text andType:AICellModelMe];
    //自动回复
    [self autoReplayWithInput:textField.text];
    
    //刷新tabelview
    [self.tableView reloadData];
    //滚到最后一行
    NSIndexPath *path = [NSIndexPath indexPathForItem:_dataModels.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    //清空输入框
    self.inPutTextField.text = @"";
    
    return YES;
}
#pragma mark -实现智能回复功能
-(void)autoReplayWithInput:(NSString*)input{
    NSString *replay = nil;
    for (int i = 0 ; i < input.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        replay = self.autoDict[[input substringWithRange:range]];
        if (replay) {
            [self addModelWithInput:replay andType:AICellModelOther];
            return;
        }
    }
    [self addModelWithInput:[NSString stringWithFormat:@"%@你个蛋",input] andType:AICellModelOther];
    
}
#pragma mark -添加新的模型
-(void)addModelWithInput:(NSString*)input andType:(AICellModelType)type{
    //添加模型
    AICellDataModel *addDataModel = [[AICellDataModel alloc]init];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc]init];
    dateformat.dateFormat = @"HH:mm";
    
    NSString *timeString = [dateformat stringFromDate:date];
    addDataModel.time = timeString;
    AICellFrameModel *lastmodel = [self.dataModels lastObject];
    //判断是否于最后一个数据时间相等
    if ([addDataModel.time isEqualToString:lastmodel.itemData.time]) {
        addDataModel.isHiddenTime = YES;
    }else{
        addDataModel.isHiddenTime = NO;
    }
    addDataModel.text = input;
    addDataModel.type = type;
    NSLog(@"time = %@ ishiddentime = %d",addDataModel.time,addDataModel.isHiddenTime);
    AICellFrameModel *addModel = [[AICellFrameModel alloc]init];
    addModel.itemData = addDataModel;
    [_dataModels addObject:addModel];
    
}
#pragma mark -数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AICellFrameModel *cellframemodel = self.dataModels[indexPath.row];
    return cellframemodel.cellHight;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"chatcellview";
    AICellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AICellView alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    AICellFrameModel *itemFrame = self.dataModels[indexPath.row];
    [cell initWithCellModel:itemFrame];
    
    return cell;
}
#pragma mark -隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark -懒加载数据
- (NSMutableArray *)dataModels{
    if (!_dataModels) {
        NSString *fullPath = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:fullPath];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        NSString *precedTime = nil;
        for (NSDictionary *dict in array) {
            AICellDataModel *itemCellData = [AICellDataModel cellModelWithDict:dict];
            //判断时间是否相等
            itemCellData.isHiddenTime = [itemCellData.time isEqualToString:precedTime];
            AICellFrameModel *itemCellFrame = [[AICellFrameModel alloc]init];
            itemCellFrame.itemData = itemCellData;
            precedTime = itemCellData.time;
            [arrayM addObject:itemCellFrame];
            
        }
        _dataModels = arrayM;
    }
    return _dataModels;
}


@end
