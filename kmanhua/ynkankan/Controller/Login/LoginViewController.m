//
//  LoginViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (IBAction)clickLogin:(id)sender {
    [self.delegate loginSuccess];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickRegister:(id)sender {
    NSLog(@"-- clickRegister --");
}


#pragma mark - Action
- (IBAction)click_dissMiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
