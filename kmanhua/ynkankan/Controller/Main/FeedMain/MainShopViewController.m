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
#import "UIImageView+YmCache.h"
#import "MainShiopDetailVC.h"
#import "MainHotManhuaCell.h"

@interface MainShopViewController ()<UITableViewDataSource, UITableViewDelegate >{
    
    NSMutableArray *hotDataArray;
    NSMutableArray *newDataArray;
    
    NSInteger page;
    BOOL isNoPage;
    
    BOOL isLoading;

}

@property (strong, nonatomic) UITableView *mainTable;
@property (strong, nonatomic) MainShopService *service;

@property (strong, nonatomic) UIButton *footerButton;

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
    
    hotDataArray = [[NSMutableArray alloc] init];
    newDataArray = [[NSMutableArray alloc] init];

}

-(void)initView{
    [self setTitle:@"Kaka"];
  
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    [self.view addSubview:backgoundView];
    self.view.backgroundColor = Color_Background;
    [self.view addSubview:self.mainTable];
}

#pragma mark - 设置表头
-(void)setTableHader{
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, kScreenWidth - 20, (kScreenWidth - 20) / 5 + 15);
    
    UIImageView *advImage = [[UIImageView alloc] init];
    advImage.frame = CGRectMake(0, 5, kScreenWidth - 20, (kScreenWidth - 20) / 5);
    [advImage ym_setImageWithURL:[NSURL URLWithString:@"http://i12.tietuku.com/72e06ccec3434887.png"] placeholderImage:nil];
    [headerView addSubview:advImage];
    
    self.mainTable.tableHeaderView = headerView;
}

#pragma mark - 网络请求
-(void)getManhuaList{
    
    __weak NSMutableArray *weakHots = hotDataArray;
    __weak NSMutableArray *weakNews = newDataArray;
    
    __weak UITableView *weakTable = self.mainTable;
    
    [self.service getHotManhuaLists:^(NSArray *hotManhuas, NSArray *newManhuas, NSError *error){
        NSLog(@">>>>>>>>");
        if (error == nil) {
            
            if (hotManhuas != nil) {
                [weakHots addObjectsFromArray:hotManhuas];
            }
            
            if (newManhuas != nil) {
                [weakNews addObjectsFromArray:newManhuas];
            }
            
            [weakTable reloadData];
            [self setTableHader];
        }
    
    }];
}

#pragma mark - loginDelegate
-(void)loginSuccess{
    self.mainTable.hidden = YES;
}

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return hotDataArray.count + newDataArray.count;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row < hotDataArray.count) {
        static NSString *cellIndentifier = @"MainHotManhuaCell";
        
        MainHotManhuaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        
        if (cell == nil) {
            cell = [[MainHotManhuaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        
        [cell setManhuaModel:[hotDataArray objectAtIndex:indexPath.row] pathRow:indexPath.row];
        
        return cell;
        
    } else {
        static NSString *cellIndentifier = @"MainShopCell";
        
        MainShopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        
        if (cell == nil) {
            cell = [[MainShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }

        [cell setData:[newDataArray objectAtIndex:indexPath.row - [hotDataArray count]]];
        
        return cell;
    }
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" didSelectRowAtIndexPath ");

    if (indexPath.row < hotDataArray.count)
        return;
    
    [self gotoNewsDetailView:[newDataArray objectAtIndex:indexPath.row - [hotDataArray count]]];
    
}


//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row < 3) {
        return 239;
    } else {
        return 70;
    }
    
}

#pragma mark - goto
-(void)gotoNewsDetailView:(NSMutableDictionary *)dic{
    MainShiopDetailVC *detailVC = [[MainShiopDetailVC alloc] init];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.detailModel = dic;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - get set
-(UITableView *)mainTable{

    if (!_mainTable) {
        
        _mainTable = [[UITableView alloc] init];
        _mainTable.frame = CGRectMake(10, 66, kScreenWidth - 20, kScreenHeight - 116);
        _mainTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mainTable.delegate = self;
        _mainTable.showsVerticalScrollIndicator = NO;
        _mainTable.showsHorizontalScrollIndicator = NO;
        _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTable.dataSource = self;
        _mainTable.backgroundColor = Color_Background;
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
