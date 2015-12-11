//
//  MeViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/9/17.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeViewController.h"
#import "AppConstant.h"

@interface MeViewController ()

@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];

}

- (void)initView{
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    backgoundView.backgroundColor = Color_Background;
    [self.view addSubview:backgoundView];
    
    [self.view addSubview:self.mainTableView];
    [self setTitle:@"나의"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark get set
-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.frame = CGRectMake(10, 64, kScreenWidth - 20, kScreenHeight - 114);
        _mainTableView.backgroundColor = Color_Background;
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    return _mainTableView;
}


@end
