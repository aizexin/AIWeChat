//
//  ViewController.m
//  AI联系人
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AILoginController.h"
#import "AIDefine.h"
#import "MBProgressHUD+NJ.h"
#import "AIConfigModel.h"
#import "MBProgressHUD.h"
#import "AICreateBar.h"
@interface AILoginController ()
/*账号文本框*/
@property (weak, nonatomic) IBOutlet UITextField *codeText;
/*密码文本框*/
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
/*记住密码*/
@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;
/*自动登录*/
@property (weak, nonatomic) IBOutlet UISwitch *autoSwitch;
/*登录按钮*/
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property(nonatomic,strong)NSDictionary *rememberDict;
@property(nonatomic,strong)NSDictionary *autoLoginDict;
/*配置文件信息*/
//@property(nonatomic,strong)NSMutableArray *configM;

@end

@implementation AILoginController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *home = NSHomeDirectory();
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    //通知
    [notification addObserver:self selector:@selector(onNotificationListener) name:UITextFieldTextDidChangeNotification object:_codeText];
    [notification addObserver:self selector:@selector(onNotificationListener) name:UITextFieldTextDidChangeNotification object:_passwordText];
    //读取数据
    [self readdata];
    if([_rememberSwitch isOn]){
        [_loginBtn setEnabled:YES];
    }
    if ([_autoSwitch isOn]) {
        [self autoLogin];
    }
    
}
#pragma mark -跳转页面
-(void)login2Page{
    [self.navigationController pushViewController:[AICreateBar createNavigtionTabBar] animated:YES];
}



#pragma mark -自动登录
- (void)autoLogin{
    //跳转页面
    
    [MBProgressHUD showMessage:@"艾江山正在帮你登录..." toView:self.navigationController.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 
        //储存数据
//        [self savedata];
        //跳转页面
        [self login2Page];
        [MBProgressHUD hideHUDForView:self.navigationController.view];
    });
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    [self.view endEditing:NO];
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
//    AILog(@"login- viewWillDisappear");
    [self.view endEditing:NO];
}

#pragma mark -触屏事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_codeText resignFirstResponder];
    [_passwordText resignFirstResponder];
}
#pragma mark -登录按钮监听事件
- (IBAction)loginBtn:(UIButton *)sender {
    [MBProgressHUD showMessage:@"正在拼命的加载"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (![_codeText.text  isEqual: @"aizexin"]) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"账号出错"];
            return;
        }
        if (![_passwordText.text isEqualToString:@"123"]) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"密码出错"];
            
            return;
        }
        //储存数据
        [self savedata];
        //跳转页面
        [self.navigationController pushViewController:[AICreateBar createNavigtionTabBar] animated:YES];
        [MBProgressHUD hideHUD];
    });
    
}
/*#pragma mark -页面准备跳转的时候调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    
    vc.title = [NSString stringWithFormat:@"%@的通讯录",_codeText.text];
}*/
#pragma mark -记住密码和自动登录
- (IBAction)action:(UISwitch *)sender {
    if (_autoSwitch.isOn) {
        AILog(@"记住密码");

        [_rememberSwitch setOn:YES];
    }else{
    }
    if (!_rememberSwitch.isOn) {
        [_autoSwitch setOn:NO];
    }else{
    }
}
#pragma mark -读取数据
-(void)readdata{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //得到的是arrayM
    NSMutableArray *arrayM = [defaults valueForKey:@"aizexin"];
    NSDictionary *dict = [arrayM firstObject];
    
    [_rememberSwitch setOn:[[dict valueForKey:@"remember"] boolValue] ];
    AILog(@"%@",[dict valueForKey:@"autoLogin"]);
    [_autoSwitch setOn:[[dict valueForKey:@"autoLogin"] boolValue]];
    _codeText.text = [dict valueForKey:@"code"];
    if ([_rememberSwitch isOn]) {
        _passwordText.text = [dict valueForKey:@"password"];
    }
}
#pragma mark -存储数据
-(void)savedata{
    //偏好设置存储
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arrayM = [NSMutableArray array];

    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    //储存按钮状态
    if ([_rememberSwitch isOn]) {
        _rememberDict = @{@"remember":@1};
    }else{
        _rememberDict = @{@"remember":@0};
    }
    if ([_autoSwitch isOn]) {
        _autoLoginDict = @{@"autoLogin":@1};
    }else{
        _autoLoginDict = @{@"autoLogin":@0};
    }
    [dictM addEntriesFromDictionary:_rememberDict];
    [dictM addEntriesFromDictionary:_autoLoginDict];
    NSDictionary *codeDict = [NSDictionary dictionaryWithObjectsAndKeys:_codeText.text,@"code", nil];
    NSDictionary *pswDict = [NSDictionary dictionaryWithObjectsAndKeys:_passwordText.text,@"password", nil];
    [dictM addEntriesFromDictionary:codeDict];
    [dictM addEntriesFromDictionary:pswDict];
    [arrayM addObject:dictM];
    
    [defaults setObject:arrayM forKey:_codeText.text];

}
#pragma makr -接受通知
- (void)onNotificationListener{
    if (_codeText.text.length > 0 && _passwordText.text.length > 0) {
        [_loginBtn setEnabled:YES];
    }else{
        [_loginBtn setEnabled:NO];
    }
}

@end
