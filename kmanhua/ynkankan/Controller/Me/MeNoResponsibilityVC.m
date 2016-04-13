//
//  MeNoResponsibilityVC.m
//  ynkankan
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeNoResponsibilityVC.h"

@interface MeNoResponsibilityVC ()

@end

@implementation MeNoResponsibilityVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)initView
{
    
    [self setLeftButton];
    [self setTitle:@"免责声明"];
    
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
