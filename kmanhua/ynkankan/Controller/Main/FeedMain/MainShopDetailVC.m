//
//  MainShopDetailVC.m
//  ynkankan
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopDetailVC.h"
#import "DetailHeaderView.h"
#import "DetailImageCell.h"
#import "DataBaseManager.h"

//480 : 640

@interface MainShopDetailVC ()<UITableViewDelegate, UITableViewDataSource>
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
    [headerView.favButton addTarget:self action:@selector(checkFav:) forControlEvents:UIControlEventTouchUpInside];
//    [headerView.favButton addTarget:self action:@selector(checkFav:) forControlEvents:UIControlEventTouchUpInside];
    [headerView setContent:test_Content];
    [headerView favButtonByUid:self.detailModel.m_uid];
    
    
    mainTableView = [[UITableView alloc] init];
    mainTableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    mainTableView.tableHeaderView = headerView;
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    
    mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:mainTableView];
    
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailImageCell *cell = [DetailImageCell initCell:tableView];
    [cell imageUrl:@""];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 640.0f * kScreenWidth / 480.0f;
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

#pragma mark - Action
-(void)checkFav:(UIButton *)button
{
    NSLog(@">>>>>>>>>");
    if ([[DataBaseManager shareInstance] isFav:self.detailModel.m_uid]) {
        [[DataBaseManager shareInstance] deleteManhua:self.detailModel.m_uid];
        
    } else {
        [[DataBaseManager shareInstance] insertManhua:self.detailModel];
    }

    [headerView favButtonByUid:self.detailModel.m_uid];
}



@end
