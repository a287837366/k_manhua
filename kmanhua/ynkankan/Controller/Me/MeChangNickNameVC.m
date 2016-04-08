//
//  MeChangNickNameVC.m
//  ynkankan
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeChangNickNameVC.h"
#import "LoginService.h"
#import "CustomProgressHUD.h"
#import "UserSharePrefre.h"
#import "MBProgressHUD+ToastDialog.h"

@interface MeChangNickNameVC (){
    
    LoginService *service;
}

@property (weak, nonatomic) IBOutlet UITextField *textNikeName;

@end

@implementation MeChangNickNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self initData];

}

-(void)initData{
    
    service = [[LoginService alloc] init];
    
}

-(void)initView{
    [self setTitle:@"修改昵称"];
    [self setLeftButton];
    [self setRigthButton];
}

#pragma mark 返回
-(void)setLeftButton {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark 返回
-(void)closeMethod{
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark Navagation 右侧按钮
- (void)setRigthButton{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"确认", nil) style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark 右侧action
-(void)clickRightButton{
    if (self.textNikeName.text.length <= 0) {
        [MBProgressHUD Toast:nil withText:@"请输入昵称"];
        return;
    }
    
    [self updateNikeName];
}

#pragma mark - 请求网络
//更新昵称
-(void)updateNikeName{
    [CustomProgressHUD showHUD:self.view];
    
    __weak typeof(self) weakself = self;
    
    NSMutableDictionary *requsetParam = [[NSMutableDictionary alloc] init];
    [requsetParam setObject:[[UserSharePrefre sharedInstance] userId] forKey:@"username"];
    [requsetParam setObject:[[UserSharePrefre sharedInstance] userpw] forKey:@"userpw"];
    [requsetParam setObject:self.textNikeName.text forKey:@"usernikename"];
    
    [service updateNikeName:@{@"username" : [[UserSharePrefre sharedInstance] userId],
                              @"userpw":[[UserSharePrefre sharedInstance] userpw],
                              @"usernikename":self.textNikeName.text}
                   response:^(NSString *success, NSError *error){
        
        if (error != nil) {
            [weakself getUserMe];
        } else {
            [CustomProgressHUD hideHUD:weakself.view];
        }
        
    }];
    
}

-(void)getUserMe{

    __weak typeof(self) weakself = self;
    
    [service requsetLogin:[[UserSharePrefre sharedInstance] userId] loginPw:[[UserSharePrefre sharedInstance] userpw]
                      response:^(NSMutableDictionary *returnDic, NSError *error){
                          
                          [CustomProgressHUD hideHUD:weakself.view];
                          [[UserSharePrefre sharedInstance] refreshUserByDic:returnDic];
                          
                          
                          [MBProgressHUD Toast:nil withText:@"修改成功"];
                      }];

}



@end
