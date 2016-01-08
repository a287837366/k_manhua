//
//  MainShopViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/11/2.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopViewController.h"
#import "LoiginPromptView.h"
#import "MainShopCell.h"
#import "MainHeaderView.h"
#import "NewsWebDetialViewController.h"
#import "MJRefresh.h"
#import "LoginViewController.h"
#import "CustomProgressHUD.h"
#import "MainShopService.h"
#import "UIImageView+WebCache.h"

@interface MainShopViewController ()<UITableViewDataSource, UITableViewDelegate, MainHeaderDelegate, LoiginPromptViewDelegate, LoginViewControllerDelegate>{
    
    NSMutableArray *freeDataArray;
    NSMutableArray *newDataArray;
    
    NSInteger page;
    
    BOOL isNoPage;

}

@property (strong, nonatomic) UITableView *mainTable;
@property (strong, nonatomic) MainHeaderView *headerView;

@property (strong, nonatomic) MainShopService *service;

@end

@implementation MainShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    
    
    [self getManhuaList];
}

-(void)initData{
    isNoPage = NO;
    page = 0;
    
    freeDataArray = [[NSMutableArray alloc] init];
    newDataArray = [[NSMutableArray alloc] init];

}

-(void)initView{
    [self setTitle:@"야만"];
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    [self.view addSubview:backgoundView];
//    [self setRightButton];
    self.view.backgroundColor = Color_Background;
    [self.view addSubview:self.mainTable];
}

#pragma mark - 设置右侧
- (void)setRightButton{
    UIBarButtonItem *RightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_login"] style:UIBarButtonItemStylePlain target:self action:@selector(loginMethod)];
    self.navigationItem.rightBarButtonItem = RightButton;
}

#pragma mark 返回
-(void)loginMethod{
    
    LoiginPromptView *popView = [[LoiginPromptView alloc] init];
    popView.delegate = self;
    [popView showNavigation];
    [self.view addSubview:popView];
    
}


#pragma mark - 设置表头
-(void)setTableHader{
    self.headerView = [[MainHeaderView alloc] init];
    self.headerView.delegate = self;
    [self.headerView setDate:newDataArray];
    self.headerView.frame = CGRectMake(0, 0, kScreenWidth, self.headerView.viewHeight);
    self.mainTable.tableHeaderView = self.headerView;

}

#pragma mark - 网络请求
-(void)getManhuaList{
    [self.service getManhuaList:page response:^(NSMutableArray *newdata, NSMutableArray *freedata, NSError *error){
        
        if (error) {
            NSLog(@" 返回错误 ");
            return ;
        }
        
        if (freedata == nil) {
            [self.mainTable footerEndRefreshing];
            return;
        }

        [freeDataArray addObjectsFromArray:freedata];
        [newDataArray addObjectsFromArray:newdata];
        
        if (page == 0) {
            [self delayRefreshEnd];
            return;
        }

        [self performSelector:@selector(delayRefreshEnd) withObject:nil afterDelay:2.0f];

        
    }];

}

#pragma mark - popDelegate
-(void)didClickLogin{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.delegate = self;
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark - loginDelegate
-(void)loginSuccess{
    self.mainTable.hidden = YES;
}

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return freeDataArray.count;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"MainShopCell";
    MainShopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[MainShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];

    }
    
    cell.titleLable.text = [[freeDataArray objectAtIndex:indexPath.row] objectForKey:@"m_name"];
    cell.timeLable.text = [[freeDataArray objectAtIndex:indexPath.row] objectForKey:@"m_createTime"];
    [cell.leftImage sd_setImageWithURL:[NSURL URLWithString:[[freeDataArray objectAtIndex:indexPath.row] objectForKey:@"m_icon"]]];

    
    return cell;

}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" didSelectRowAtIndexPath ");
    [self gotoNewsDetailView:[[freeDataArray objectAtIndex:indexPath.row] objectForKey:@"m_url"] title:[[freeDataArray objectAtIndex:indexPath.row] objectForKey:@"m_name"]];
}


//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

//表头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 30);
    
    UIView *cornorView = [[UIView alloc] init];
    cornorView.frame = CGRectMake((kScreenWidth - 150) / 2, 5, 150, 20);
    cornorView.backgroundColor = [UIColor whiteColor];
    cornorView.layer.cornerRadius = 5;
    [view addSubview:cornorView];
    
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(0, 0, kScreenWidth, 30);
    lable.textColor = Color_Main;
    lable.font = [UIFont systemFontOfSize:13];
    lable.text = @"---  지난 이야기  ---";
    lable.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:lable];
    return view;
}


//上啦刷新
-(void)footerRereshing{
    [self getManhuaList];

}

-(void)delayRefreshEnd{
    
    if (page == 0) {
        [self setTableHader];
    }
    
    page++;
    
    [self.mainTable reloadData];
    
    [self.mainTable footerEndRefreshing];
}


#pragma mark headerDelegate
-(void)didClickHeader:(NSInteger)index{
    [self gotoNewsDetailView:[[newDataArray objectAtIndex:index] objectForKey:@"m_url"] title:[[newDataArray objectAtIndex:index] objectForKey:@"m_name"]];
}

#pragma mark goto
-(void)gotoNewsDetailView:(NSString *)openUrl title:(NSString *)title{
    NewsWebDetialViewController *detailVC = [[NewsWebDetialViewController alloc] init];
    detailVC.title = title;
    detailVC.openUrl = openUrl;
    detailVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - get set
-(UITableView *)mainTable{

    if (!_mainTable) {
        
        _mainTable = [[UITableView alloc] init];
        _mainTable.frame = CGRectMake(10, 64, kScreenWidth - 20, kScreenHeight - 114);
        _mainTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mainTable.delegate = self;
        _mainTable.showsVerticalScrollIndicator = NO;
        _mainTable.showsHorizontalScrollIndicator = NO;
        _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTable.dataSource = self;
        _mainTable.backgroundColor = Color_Background;
        [_mainTable addFooterWithTarget:self action:@selector(footerRereshing)];
    }

    return _mainTable;
}

-(MainShopService *)service{

    if (!_service) {
        _service = [[MainShopService alloc] init];
    }
    
    return _service;
}

@end
