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
#import "MBProgressHUD+ToastDialog.h"
#import "UserSharePrefre.h"
#import "MeViewController.h"
#import "MainNavigationView.h"
#import "MainCreateNewsVC.h"
#import "MainShopDetailVC.h"
#import "MainShioThreeCell.h"
#import "ChooseTypeVC.h"


@interface MainShopViewController ()<UITableViewDataSource, UITableViewDelegate, MainHeaderDelegate>{

    NSInteger page;
    BOOL isNoPage;
}

@property (strong, nonatomic) UITableView *mainTable;
@property (strong, nonatomic) MainShopService *service;
@property (weak, nonatomic) IBOutlet UIButton *btnCreate;
@property (strong, nonatomic) UIButton *refreshButton;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) NSInteger refreshType;

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
    self.refreshType = -1;

    self.dataArray = [[NSMutableArray alloc] init];
}

-(void)initView{
    self.view.backgroundColor = Color_Background;
    
    [self setTitle:@"首页"];
    
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
    
    [self initRefreshView];
    [self initTableHeader];
    [self initRefreshView];
    
    [self.view addSubview:self.mainTable];
}


-(void) initRefreshView {
  
    self.refreshButton = [[UIButton alloc] init];
    self.refreshButton.frame = CGRectMake((kScreenWidth - 100) / 2, (kScreenHeight - 30) / 2, 100, 30);
    self.refreshButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.refreshButton.layer.cornerRadius = 5;
    [self.refreshButton addTarget:self action:@selector(clickRefresh:) forControlEvents:UIControlEventTouchUpInside];
    [self.refreshButton setTitle:@"重新加载" forState:UIControlStateNormal];
    self.refreshButton.backgroundColor = Color_666666;
    
    [self.view addSubview:self.refreshButton];
}

-(void) initTableHeader {

    MainHeaderView *headerView = [[MainHeaderView alloc] init];
    headerView.delegate = self;
    self.mainTable.tableHeaderView = headerView;
}

-(void)clickRefresh:(UIButton *)button{
    self.mainTable.hidden = NO;
    [self getManhuaList];
}

#pragma mark -
-(void)didClickHeader:(NSInteger)index{

}

- (IBAction)clickCreate:(id)sender {
    
    if (![[UserSharePrefre sharedInstance] isLogin]) {
        [MBProgressHUD Toast:self.view withText:@"请登入"];
        return;
    }
    
    [self gotoChooseTypeVC];

}

#pragma mark 返回
-(void)loginMethod{
    
    LoiginPromptView *popView = [[LoiginPromptView alloc] init];
    [popView showNavigation];
    [self.view addSubview:popView];
    
}


#pragma mark - 网络请求
-(void)getManhuaList{
    [CustomProgressHUD showHUD:self.view];
    __weak typeof(self) weakSelf = self;
    
    [self.service  getManhuaList:page type:0 response:^(NSMutableArray *freedata, NSInteger pageCount, NSError *error){

        if (error) {
            NSLog(@" 返回错误 ");
            [CustomProgressHUD hideHUD:weakSelf.view];
            
            if (weakSelf.dataArray.count <= 0) {
                weakSelf.mainTable.hidden = YES;
            }
            
            return ;
        }
        
        if (freedata == nil) {
            [weakSelf.mainTable footerEndRefreshing];
            [CustomProgressHUD hideHUD:weakSelf.view];
            
            if (weakSelf.dataArray.count <= 0) {
                weakSelf.mainTable.hidden = YES;
            }
            
            
            return;
        }
        

        if (page + 1 >= pageCount) {
            isNoPage = YES;
        }

        if (weakSelf.refreshType == -1 || weakSelf.refreshType == 0) {
            [weakSelf.dataArray removeAllObjects];
        }
        
        [weakSelf.dataArray addObjectsFromArray:freedata];
        
        [self performSelector:@selector(delayRefreshEnd) withObject:nil afterDelay:0.1f];

        
    }];

}
#pragma mark - MainNavigationViewDelegate
-(void)didClickTypeByType:(NewsType)type{
    [self.dataArray removeAllObjects];
    [self.mainTable reloadData];
    
    isNoPage = NO;
    page = 0;
    
    [self getManhuaList];
}

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
//    NSLog(@"%ld >>>>> %@",(long)indexPath.row , model.extendArray);
    
    if (model.extendArray == nil) {
      
        static NSString *cellIndentifier = @"MainShopCell";
        MainShopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        
        if (cell == nil) {
            cell = [[MainShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            
        }
        
        [cell setModel:model];
        
        return cell;

    } else {
      
        static NSString *cellIndentifier = @"MainShioThreeCell";
        MainShioThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        
        if (cell == nil) {
            cell = [[MainShioThreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            
        }
        
        [cell setModel:model];
        
        return cell;

    }
    
  
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" didSelectRowAtIndexPath ");
    [self gotoDetailPage:[self.dataArray objectAtIndex:indexPath.row]];
}


//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    if (model.extendArray == nil) {
        return MainCell_Height;
    } else {
        return MainShioThreeCellHeight;
    }
    
    
}


//上啦刷新
-(void)footerRereshing{
    
    self.refreshType = 1;
    
    if (isNoPage)
    {
        [self.mainTable footerEndRefreshing];
        return;
    }
    
    [self getManhuaList];
}

-(void)headerRereshing{
    
    self.refreshType = 0;
    isNoPage = NO;
    
    page = 0;
    
    [self getManhuaList];
}

-(void)delayRefreshEnd{
    [CustomProgressHUD hideHUD:self.view];
    page++;
    
    self.refreshType = -1;
    
    [self.mainTable reloadData];
    [self.mainTable footerEndRefreshing];
    [self.mainTable headerEndRefreshing];
}

#pragma mark goto
/*
 * 跳转到选择类别
 */
-(void)gotoChooseTypeVC{

    ChooseTypeVC *chooseType = [[ChooseTypeVC alloc] init];
    [self.navigationController pushViewController:chooseType animated:YES];
}

-(void)gotoNewsDetailView:(NSString *)openUrl title:(NSString *)title{
    NewsWebDetialViewController *detailVC = [[NewsWebDetialViewController alloc] init];
    detailVC.title = title;
    detailVC.openUrl = openUrl;
    detailVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(void)gotoDetailPage:(NewsModel *)model{

    MainShopDetailVC *detailVC = [[MainShopDetailVC alloc] init];
    detailVC.detailModel = model;
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

#pragma mark - get set
-(UITableView *)mainTable{

    if (!_mainTable) {
        
        _mainTable = [[UITableView alloc] init];
        _mainTable.frame = CGRectMake(1, 64, kScreenWidth - 2, kScreenHeight - 116);
        _mainTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mainTable.delegate = self;
        _mainTable.showsVerticalScrollIndicator = NO;
        _mainTable.showsHorizontalScrollIndicator = NO;
        _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTable.dataSource = self;
        _mainTable.backgroundColor = Color_Background;
        [_mainTable addFooterWithTarget:self action:@selector(footerRereshing)];
        [_mainTable addHeaderWithTarget:self action:@selector(headerRereshing)];
        
        
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
