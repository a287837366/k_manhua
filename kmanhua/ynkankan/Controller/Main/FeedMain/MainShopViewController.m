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

@interface MainShopViewController ()<UITableViewDataSource, UITableViewDelegate, MainHeaderDelegate, LoiginPromptViewDelegate, LoginViewControllerDelegate>{
    
    NSMutableArray *freeDataArray;


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
    
}

-(void)initData{
    freeDataArray = [[NSMutableArray alloc] init];
    
    [CustomProgressHUD showHUD:self.view];
    [self.service getManhuaList:0 response:^(NSMutableArray *newdata, NSMutableArray *freedata, NSError *error){
        [CustomProgressHUD hideHUD:self.view];
       
        if (error) {
            NSLog(@" 返回错误 ");
            return ;
        }
        NSLog(@">>>>> %@", freedata);
        [freeDataArray addObjectsFromArray:freedata];
        [self.mainTable reloadData];
    
    }];
}

-(void)initView{
    [self setTitle:@"야만"];
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    backgoundView.backgroundColor = Color_Background;
    [self.view addSubview:backgoundView];
    [self setRightButton];
    
    
    [self.view addSubview:self.mainTable];
    self.headerView = [[MainHeaderView alloc] init];
    self.headerView.delegate = self;
    [self.headerView setDate];
    self.headerView.frame = CGRectMake(0, 0, kScreenWidth, self.headerView.viewHeight);
    self.mainTable.tableHeaderView = self.headerView;

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
    
    return cell;

}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" didSelectRowAtIndexPath ");
    [self gotoNewsDetailView:[[freeDataArray objectAtIndex:indexPath.row] objectForKey:@"m_url"]];
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
    [self performSelector:@selector(testRefreshEnd) withObject:nil afterDelay:2.0f];
}

-(void)testRefreshEnd{
    [self.mainTable footerEndRefreshing];
}


#pragma mark headerDelegate
-(void)didClickHeader:(NSInteger)index{
    [self gotoNewsDetailView:[[freeDataArray objectAtIndex:index] objectForKey:@"m_url"]];
}

#pragma mark goto
-(void)gotoNewsDetailView:(NSString *)openUrl{
    NewsWebDetialViewController *detailVC = [[NewsWebDetialViewController alloc] init];
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
        _mainTable.backgroundColor = Color_Background;
        _mainTable.dataSource = self;
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

//-(MainHeaderView *)headerView{
//
//    if (!_headerView) {
//        
//    }
//
//    return _headerView;
//}

@end
