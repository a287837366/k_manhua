//
//  MainShopDetailVC.m
//  ynkankan
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopDetailVC.h"
#import "DetailHeaderView.h"

//480 : 640

@interface MainShopDetailVC ()
{
    
    UITableView *mainTableView;
    DetailHeaderView *headerView;
}


@end

@implementation MainShopDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)initView{
    self.view.backgroundColor = Color_Background;
    [self setTitle:@"详情"];
    [self setLeftButton];
  
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
    
    headerView = [[DetailHeaderView alloc] init];
    headerView.frame = CGRectMake(0, 0, kScreenWidth, [headerView getContentHeight:test_Content]);
    
    [headerView setContent:test_Content];
    
    
    mainTableView = [[UITableView alloc] init];
    mainTableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    mainTableView.tableHeaderView = headerView;
    
    mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:mainTableView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
