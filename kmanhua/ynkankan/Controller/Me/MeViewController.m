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
    dataArray = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects:@"방문기록", @"의견제출 하기 ", @"제휴문의", @"땐짠 하기", nil], [[NSMutableArray alloc] initWithObjects:@"웨이씬 공유하기", nil], nil];
}

-(void)viewWillAppear:(BOOL)animated{
     self.navigationController.navigationBar.alpha = 0;
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
    
    navigation = [[MeNavigationView alloc] init];
    navigation.titleLable.text = @"닉넴";
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark tableView Delegate

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
                NSLog(@"<< 방문기록 >>");
                
                break;
                
            case 1:
                NSLog(@"<< 의견제출 하기 >>");
                [self gotoFeedBackView];
                break;
                
            case 2:
                NSLog(@"<< 제휴 문의 >>");
                [self gotoContactView];
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
