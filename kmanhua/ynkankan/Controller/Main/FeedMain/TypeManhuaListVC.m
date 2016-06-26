//
//  TypeManhuaListVC.m
//  ynkankan
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "TypeManhuaListVC.h"
#import "MainShopService.h"
#import "NewsModel.h"
#import "MainShopCell.h"
#import "MainShioThreeCell.h"
#import "CustomProgressHUD.h"
#import "MJRefresh.h"
#import "MainShopDetailVC.h"


@interface TypeManhuaListVC ()<UITableViewDataSource, UITableViewDelegate>{

    MainShopService *service;
    NSInteger page;
    BOOL isNoPage;
    
}

@property (strong, nonatomic) UITableView *mainTaleView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) NSInteger refreshType;

@end

@implementation TypeManhuaListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];

}

- (void)initData {

    isNoPage = NO;
    page = 0;
    self.refreshType = -1;
    
    service = [[MainShopService alloc] init];
    self.dataArray = [[NSMutableArray alloc] init];
    
}

- (void)initView {
    
    self.view.backgroundColor = Color_Background;
    
    [self initTitle];
    [self initBackButton];
    [self initTableView];
    
    [self getManhuaList];
    
}

- (void)initTitle {

    switch (self.type) {
        case 1:
            [self setTitle:@"招聘"];
            break;
            
        case 2:
            [self setTitle:@"求职"];
            break;
            
        case 3:
            [self setTitle:@"房产"];
            break;
            
        case 4:
            [self setTitle:@"宠物"];
            break;
            
        default:
            break;
    }
    
}

- (void)initTableView {

    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
    
    self.mainTaleView = [[UITableView alloc] init];
    self.mainTaleView.frame = CGRectMake(1, 64, kScreenWidth - 2, kScreenHeight - 64);
    self.mainTaleView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.mainTaleView.delegate = self;
    self.mainTaleView.dataSource = self;
    self.mainTaleView.showsVerticalScrollIndicator = NO;
    self.mainTaleView.showsHorizontalScrollIndicator = NO;
    self.mainTaleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTaleView.backgroundColor = Color_Background;
    [self.mainTaleView addFooterWithTarget:self action:@selector(footerRereshing)];
    [self.mainTaleView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    [self.view addSubview:self.mainTaleView];
}

- (void)initBackButton {
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

//后退按钮事件
-(void)closeMethod{
    [self.navigationController popToRootViewControllerAnimated:YES];
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

-(void)footerRereshing{
    
    self.refreshType = 1;
    
    if (isNoPage)
    {
        [self.mainTaleView footerEndRefreshing];
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


#pragma mark - 网络请求
-(void)getManhuaList{
    [CustomProgressHUD showHUD:self.view];
    __weak typeof(self) weakSelf = self;
    
    [service  getManhuaList:page type:self.type response:^(NSMutableArray *freedata, NSInteger pageCount, NSError *error){
        [CustomProgressHUD hideHUD:weakSelf.view];
      
        if (error) {
            NSLog(@" 返回错误 ");
            return ;
        }
        
        if (freedata == nil) {
            [weakSelf.mainTaleView footerEndRefreshing];
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

#pragma mark - goto
-(void)gotoDetailPage:(NewsModel *)model{
    
    MainShopDetailVC *detailVC = [[MainShopDetailVC alloc] init];
    detailVC.detailModel = model;
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}




-(void)delayRefreshEnd{
//    [CustomProgressHUD hideHUD:self.view];
    page++;
    
    self.refreshType = -1;
//
    [self.mainTaleView reloadData];
    [self.mainTaleView footerEndRefreshing];
    [self.mainTaleView headerEndRefreshing];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
