//
//  NewsMainViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/9/17.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "NewsMainViewController.h"

@interface NewsMainViewController ()

@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation NewsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self initView];
}

- (void)initView{
    [self setTitle:@"위쳇"];
    
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    backgoundView.backgroundColor = Color_Background;
    [self.view addSubview:backgoundView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark get set
-(UITableView *)mainTableView


@end
