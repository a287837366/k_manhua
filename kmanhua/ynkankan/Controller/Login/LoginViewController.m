//
//  LoginViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LoginService.h"
#import "MBProgressHUD+ToastDialog.h"
#import "CustomProgressHUD.h"
#import "UserSharePrefre.h"

@interface LoginViewController ()<RegisterdDetailViewDelegate>

@property (strong, nonatomic) LoginService *service;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
}

-(void)initView{
    
    
    [self.idTextFile addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.pwTextFile addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
#pragma mark - textFileDelegte
- (void)textFieldDidChange:(UITextField *)textField{
    
}

#pragma mark - resigerDelegate 
-(void)registeSuccess{
    NSLog(@" -- registeSuccess --");
    [self performSelector:@selector(testRefreshEnd) withObject:nil afterDelay:1.0f];
}

-(void)testRefreshEnd{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Action
- (IBAction)clickLogin:(id)sender {
    
    if (self.idTextFile.text.length <= 0) {
        [MBProgressHUD Toast:self.view withText:@"请输入帐号"];
        return;
    }
    
    if (self.idTextFile.text.length < 6) {
        [MBProgressHUD Toast:self.view withText:@"帐号必须大于6位"];
        return;
    }
    
    if (self.idTextFile.text.length > 13) {
        [MBProgressHUD Toast:self.view withText:@"帐号必须小于13位"];
        return;
    }
    
    if (self.pwTextFile.text.length <= 0) {
        [MBProgressHUD Toast:self.view withText:@"请输入密码"];
        return;
    }
    
    if (self.idTextFile.text.length < 6) {
        [MBProgressHUD Toast:self.view withText:@"密码必须大于6位"];
        return;
    }
    
    [CustomProgressHUD showHUD:self.view];
    [self.service requsetLogin:self.idTextFile.text loginPw:[ToolsClass stringToMd5:self.pwTextFile.text]
                  response:^(NSMutableDictionary *returnDic, NSError *error){
                      
                      [CustomProgressHUD hideHUD:self.view];
                      
                      if (error == nil) {
                          [self loginSuccess:(NSMutableDictionary *)returnDic];
                      } else {
                          [MBProgressHUD Toast:self.view withText:@"账号不存在"];
                      }
                    

                  }];
}

- (IBAction)clickRegister:(id)sender {
    NSLog(@"-- clickRegister --");
    [self gotoRegisterView];
}


#pragma mark goto
-(void)gotoRegisterView{
    RegisterViewController *regisVC = [[RegisterViewController alloc] init];
    regisVC.delegate = self;
    [self presentViewController:regisVC animated:YES completion:nil];
}

#pragma mark - Action
- (IBAction)click_dissMiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - other
-(void)loginSuccess:(NSMutableDictionary *)returnDic{
    if (returnDic == nil) {
        [MBProgressHUD Toast:self.view withText:@"帐号或者密码错误"];
        return;
    }
   
    [[UserSharePrefre sharedInstance] refreshUserByDic:returnDic];
//    NSLog(@">>>> %@", returnDic);
    
    [self.delegate loginSuccess];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - get set
-(LoginService *)service{

    if (!_service) {
        _service = [[LoginService alloc] init];
    }

    return _service;
}


@end
