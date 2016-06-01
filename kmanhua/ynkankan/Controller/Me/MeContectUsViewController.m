//
//  MeContectUsViewController.m
//  ynkankan
//
//  Created by apple on 16/1/7.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeContectUsViewController.h"

@interface MeContectUsViewController ()

@end

@implementation MeContectUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)initView{
    self.view.backgroundColor = Color_Background;
    [self setLeftButton];
    [self setTitle:@"关于我们"];
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



@end
