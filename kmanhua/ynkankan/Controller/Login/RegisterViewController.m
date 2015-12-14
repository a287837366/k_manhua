//
//  RegisterViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterdDetailView.h"

@interface RegisterViewController ()

@property (strong, nonatomic) RegisterdDetailView *detailView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.detailView];
//    [self.mainScollView addSubview:self.registerView];
    [self createView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Action
- (IBAction)clickCancle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - View
-(void)createView{
    self.detailView = [[RegisterdDetailView alloc] init];
    self.detailView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
}

@end
