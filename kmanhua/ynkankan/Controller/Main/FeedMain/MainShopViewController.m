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
#import "UserSharePrefre.h"
#import "MeViewController.h"

@interface MainShopViewController ()<UITableViewDataSource, UITableViewDelegate>{

    NSInteger page;
    BOOL isNoPage;

}

@property (strong, nonatomic) UITableView *mainTable;
@property (strong, nonatomic) MainShopService *service;

@end

@implementation MainShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
//    [self getManhuaList];
}

-(void)initData{
    isNoPage = NO;
    page = 0;

}

-(void)initView{
    [self setTitle:@"看看"];
    
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
    
    self.view.backgroundColor = Color_Background;
    
    [self.view addSubview:self.mainTable];
    
    [self setLeftButton];
    [self setRightButton];
}

-(void)setLeftButton{
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shop_title_left_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(clickMenu:)];
    leftButton.tag = 100;
    self.navigationItem.leftBarButtonItem = leftButton;
}

#pragma mark 导航条右侧侧
-(void)setRightButton{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"friend_setting"] style:UIBarButtonItemStylePlain target:self action:@selector(clickMenu:)];
    rightButton.tag = 200;
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)clickMenu:(UIButton *)btn{
    
    if (btn.tag == 200) {

        if ([[UserSharePrefre sharedInstance] isLogin]) {
           
            MeViewController *meVC = [[MeViewController alloc] init];
            [self.navigationController pushViewController:meVC animated:YES];
            
            
        } else {
         
            LoginViewController *loginVC = [[LoginViewController alloc] init];
            [self presentViewController:loginVC animated:YES completion:nil];
        
        }
        

        
    } else {
    
    }


}

#pragma mark 返回
-(void)loginMethod{
    
    LoiginPromptView *popView = [[LoiginPromptView alloc] init];
    [popView showNavigation];
    [self.view addSubview:popView];
    
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
        
        if (page == 0) {
            [self delayRefreshEnd];
            return;
        }

        [self performSelector:@selector(delayRefreshEnd) withObject:nil afterDelay:2.0f];

        
    }];

}

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"MainShopCell";
    MainShopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[MainShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];

    }
    
    return cell;

}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" didSelectRowAtIndexPath ");

}


//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MainCell_Height;
}


//上啦刷新
-(void)footerRereshing{
    

}

-(void)delayRefreshEnd{
   
    page++;
    
    [self.mainTable reloadData];
    [self.mainTable footerEndRefreshing];
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
        _mainTable.frame = CGRectMake(1, 64, kScreenWidth - 2, kScreenHeight - 65);
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
