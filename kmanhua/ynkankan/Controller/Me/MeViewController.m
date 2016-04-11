//
//  MeViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/9/17.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeViewController.h"
#import "MeHeaderView.h"
#import "MeMainTableViewCell.h"
#import "AppConstant.h"
#import "MeFeedBackController.h"
#import "MeContectUsViewController.h"
#import "MeNavigationView.h"
#import "UserSharePrefre.h"
#import "MeChangNickNameVC.h"
#import "MeHistoryViewController.h"

@interface MeViewController ()<UITableViewDataSource, UITableViewDelegate>{

    NSMutableArray *dataArray;
    MeNavigationView *navigation;

}

@property (strong, nonatomic) UITableView *mainTableView;
@property (strong, nonatomic) MeHeaderView *meHeader;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDate];
    [self initView];

}

- (void)initDate{
    dataArray = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects:@"修改昵称", @"我收藏的 ", @"关于上传", nil], [[NSMutableArray alloc] initWithObjects:@"免责声明", nil], nil];
}

-(void)viewWillAppear:(BOOL)animated{
     self.navigationController.navigationBar.alpha = 0;
        navigation.titleLable.text = [[UserSharePrefre sharedInstance] nikeName];
}

- (void)initView{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
   
    UIView *background = [[UIView alloc] initWithFrame:self.view.bounds];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = background.bounds;
    [button setBackgroundImage:[UIImage imageNamed:@"nav_top_background@3x"] forState:UIControlStateNormal];
    [background addSubview:button];
    button.userInteractionEnabled = NO;
    
    [self.view setBackgroundColor:Color_Background];
    [self.view addSubview:background];
    
    [self settingTableHeader];
    [self setFooterView];
    
    navigation = [[MeNavigationView alloc] init];

    [navigation.backButton addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navigation];
    [self.view addSubview:self.mainTableView];
    
    
}



-(void)clickBack:(UIButton *)button{
    self.navigationController.navigationBar.alpha = 1;
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)settingTableHeader{
    self.mainTableView.tableHeaderView = self.meHeader;
}


- (void)setFooterView{
    
    UIView *footerView = [[UIView alloc] init];
    footerView.frame = CGRectMake(0, 0, kScreenWidth, 75);
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(30, 15, kScreenWidth - 80, 35);
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.layer.cornerRadius = 5;
    [button addTarget:self action:@selector(clickLogout:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"注销" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.alpha = 0.7;
    [footerView addSubview:button];
    
    self.mainTableView.tableFooterView = footerView;
    
}

#pragma mark - 点击注销按钮
-(void)clickLogout:(UIButton *)button{
    [[UserSharePrefre sharedInstance] clearUser];
    self.navigationController.navigationBar.alpha = 1;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[dataArray objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"MeMainTableViewCell";
    MeMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[MeMainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.titleLable.text = [[dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}


//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0:
                NSLog(@"<< 닉넴수정 >>");
                [self gotoChangeNikeName];
                break;
                
            case 1:
                NSLog(@"<< 我收藏的 >>");
                [self gotoFavNewsVC];
//                [self gotoFeedBackView];
                break;
                
            case 2:
                NSLog(@"<< 제휴 문의 >>");
//                [self gotoContactView];
                break;
                
            case 3:
                NSLog(@"<< 땐짠 하기 >>");
                break;
                
            default:
                break;
        }
        
    } else if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 0:
                NSLog(@"<< 웨이씬 공요하기  >>");
                break;
                
            case 1:
                NSLog(@"<<  About us >>");
                
                break;
                
            default:
                break;
        }
    
    }
    
}
//表头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 10);
    view.backgroundColor = [UIColor clearColor];
    
    return view;
}

#pragma mark - goto
//의견제출하기
-(void)gotoFeedBackView{
    MeFeedBackController *feedBack = [[MeFeedBackController alloc] init];
    feedBack.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:feedBack animated:YES];
}

//제휴문의
-(void)gotoContactView{
    MeContectUsViewController *contectUsVC = [[MeContectUsViewController alloc] init];
    contectUsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:contectUsVC animated:YES];
}
//修改昵称
-(void)gotoChangeNikeName{
    
    MeChangNickNameVC *chageVC = [[MeChangNickNameVC alloc] init];
    self.navigationController.navigationBar.alpha = 1;
    chageVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chageVC animated:YES];
}
//我收藏的
-(void)gotoFavNewsVC
{   
    MeHistoryViewController *historyVC = [[MeHistoryViewController alloc] init];
    self.navigationController.navigationBar.alpha = 1;
    [self.navigationController pushViewController:historyVC animated:YES];

}

#pragma mark get set
-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.frame = CGRectMake(10, 64, kScreenWidth - 20, kScreenHeight - 64);
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    
    return _mainTableView;
}


-(MeHeaderView *)meHeader{

    if (!_meHeader) {
        _meHeader = [[MeHeaderView alloc] init];
        _meHeader.frame = CGRectMake(0, 0, kScreenWidth - 20, MeHeaderHeight);
    }

    return _meHeader;
}


@end
