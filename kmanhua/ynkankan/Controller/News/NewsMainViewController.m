//
//  NewsMainViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/9/17.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "NewsMainViewController.h"
#import "NewsWebDetialViewController.h"
#import "NewsMainViewCell.h"
#import "NewsService.h"
#import "MJRefresh.h"

@interface NewsMainViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NewsService *service;
    
    NSMutableArray *dataArray;

}

@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation NewsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self initData];
    [self initView];
}

-(void)initData{
    service = [[NewsService alloc] init];
    dataArray = [[NSMutableArray alloc] init];;
    [self getNewList];
    
}

- (void)initView{
    [self setTitle:@"위쳇"];
    
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    backgoundView.backgroundColor = Color_Background;
    [self.view addSubview:backgoundView];
    
    [self.view addSubview:self.mainTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
#pragma mark - 网路请求
-(void)getNewList{
    
    [service getWeixinList:0 response:^(NSMutableArray *weixinList, NSError *error){
        NSLog(@" %@ ",weixinList);
        [dataArray addObjectsFromArray:weixinList];
        [self performSelector:@selector(refreshEnd) withObject:nil afterDelay:0.2f];
    }];
    
    
    
}

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"NewsMainViewCell";
    NewsMainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[NewsMainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.titleLable.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"w_name"];
    cell.timeLable.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"w_createData"];
    cell.fromLable.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"w_fromdata"];
    cell.rightImageView.image = [UIImage imageNamed:@"test_3"];

    
    return cell;
}

//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self gotoNewsDetailView:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"w_url"] title:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"w_name"]];
}
//上啦刷新
-(void)footerRereshing{
    [self getNewList];
    
}

-(void)refreshEnd{
    [self.mainTableView reloadData];
    [self.mainTableView footerEndRefreshing];
}

#pragma mark goto
-(void)gotoNewsDetailView:(NSString *)openUrl title:(NSString *)title{
    NewsWebDetialViewController *detailVC = [[NewsWebDetialViewController alloc] init];
    detailVC.title = title;
    detailVC.openUrl = openUrl;
    detailVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}
#pragma mark get set
-(UITableView *)mainTableView{

    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mainTableView.frame = CGRectMake(10, 64, kScreenWidth - 20, kScreenHeight - 114);
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.backgroundColor = [UIColor clearColor];
        
        [_mainTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    }

    return _mainTableView;
}


@end
