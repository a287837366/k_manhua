//
//  LoginViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()<RegisterdDetailViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
}

-(void)initView{
    self.loginButton.userInteractionEnabled = NO;
    
    [self.idTextFile addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.pwTextFile addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
#pragma mark - textFileDelegte
- (void)textFieldDidChange:(UITextField *)textField{
    
    if (self.idTextFile.text.length > 0 && self.pwTextFile.text.length > 0) {
        self.loginButton.userInteractionEnabled = YES;
    }
    self.loginButton.userInteractionEnabled = NO;
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
    [self.delegate loginSuccess];
    [self dismissViewControllerAnimated:YES completion:nil];
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


@end
