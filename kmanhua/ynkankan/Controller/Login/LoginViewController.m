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

    [self.service requsetLogin:self.idTextFile.text loginPw:self.pwTextFile.text
                  response:^(NSMutableDictionary *returnDic, NSError *error){
                      NSLog(@" %@ ", [returnDic objectForKey:@"msg"]);
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

#pragma mark - get set
-(LoginService *)service{

    if (!_service) {
        _service = [[LoginService alloc] init];
    }

    return _service;
}


@end
