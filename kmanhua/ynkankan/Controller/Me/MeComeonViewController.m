//
//  MeComeonViewController.m
//  ynkankan
//
//  Created by aspn300 on 16/1/9.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeComeonViewController.h"

@interface MeComeonViewController ()

@property (strong, nonatomic) UIButton *comButton;

@end

@implementation MeComeonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)initView{
    [self setLeftButton];
    [self setTitle:@"응원하기"];
    
    self.view.backgroundColor = Color_Background;
    
    self.comButton = [[UIButton alloc] init];
    self.comButton.backgroundColor = Color_Main;
    self.comButton.frame = CGRectMake((kScreenWidth - 200) / 2, (kScreenHeight - 200) / 2, 200, 200);
    self.comButton.layer.cornerRadius = 100;
    [self.comButton addTarget:self action:@selector(clickComeon:) forControlEvents:UIControlEventTouchUpInside];
    self.comButton.titleLabel.font = [UIFont systemFontOfSize:35];
    [self.comButton setTitle:@"짠" forState:UIControlStateNormal];
    [self.view addSubview:self.comButton];
}

#pragma mark 返回
-(void)setLeftButton {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark 返回
-(void)closeMethod{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - Action 
-(void)clickComeon:(UIButton *)button{
    [MBProgressHUD Toast:nil withText:@"감사합니당."];
}

@end
