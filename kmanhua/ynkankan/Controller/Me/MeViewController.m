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
#import "MeNoResponsibilityVC.h"
#import "DataBaseManager.h"
#import "EmptyView.h"
#import "LoginViewController.h"
#import "MBProgressHUD+ToastDialog.h"


@interface MeViewController ()<UITableViewDataSource, UITableViewDelegate, EmptyViewDelegate>{

    NSMutableArray *dataArray;
    MeNavigationView *navigation;
    
    UIButton *footerButton;
    EmptyView *emptyView;
}

@property (strong, nonatomic) UITableView *mainTableView;
@property (strong, nonatomic) MeHeaderView *meHeader;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDate];
    [self initView];
    [self initEmptyView];

}

- (void)initDate{
    dataArray = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects:@"修改昵称", @"我收藏的 ", @"关于我们", nil], [[NSMutableArray alloc] initWithObjects:@"免责声明", nil], nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [self reloadView];
}

-(void)reloadView{
    if (![[UserSharePrefre sharedInstance] isLogin]) {
        
        self.mainTableView.hidden = YES;
        emptyView.hidden = NO;
        
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
    } else {
        
        self.mainTableView.hidden = NO;
        emptyView.hidden = YES;
        
        self.meHeader.userId.text = [[UserSharePrefre sharedInstance] userId];
        self.meHeader.nikeName.text = [[UserSharePrefre sharedInstance] nikeName];
        
        [self.view setBackgroundColor:Color_Background];
        
    }
    
    [self.mainTableView reloadData];
}

- (void)initView{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.navigationItem.title = @"我";
   
    UIView *background = [[UIView alloc] initWithFrame:self.view.bounds];
    
    
    [self.view addSubview:background];
    
    [self settingTableHeader];
    [self setFooterView];
    
    navigation = [[MeNavigationView alloc] init];

    [navigation.backButton addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navigation];
    [self.view addSubview:self.mainTableView];
    
    
}

-(void)initEmptyView{
    
    emptyView = [[EmptyView alloc] init];
    [emptyView setEmptyMsg:@"您还没有登入"];
    emptyView.delegate = self;
    [self.view addSubview:emptyView];
    
}


#pragma mark - EmptyDelegate
-(void)didClickEmpty{
    [self gotoLogin];
}

-(void)clickBack:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)settingTableHeader{
    self.mainTableView.tableHeaderView = self.meHeader;
}


- (void)setFooterView{
    
    UIView *footerView = [[UIView alloc] init];
    footerView.frame = CGRectMake(0, 0, kScreenWidth, 75);
    
    footerButton = [[UIButton alloc] init];
    footerButton.frame = CGRectMake(40, 15, kScreenWidth - 80, 35);
    footerButton.backgroundColor = Color_ButtonColor;
    footerButton.titleLabel.font = [UIFont systemFontOfSize:14];
    footerButton.layer.cornerRadius = 5;
    [footerButton addTarget:self action:@selector(clickLogout:) forControlEvents:UIControlEventTouchUpInside];
    [footerButton setTitle:@"注销" forState:UIControlStateNormal];
    [footerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [footerView addSubview:footerButton];
    
    self.mainTableView.tableFooterView = footerView;
    
}

#pragma mark - 点击注销按钮
-(void)clickLogout:(UIButton *)button{
    [[UserSharePrefre sharedInstance] clearUser];
    [[DataBaseManager shareInstance] deleteAllManhua];
    [MBProgressHUD Toast:nil withText:@"注销成功"];
    [self reloadView];
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
                [self gotoNoResponVC];
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
    chageVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chageVC animated:YES];
}
//我收藏的
-(void)gotoFavNewsVC
{   
    MeHistoryViewController *historyVC = [[MeHistoryViewController alloc] init];
    historyVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:historyVC animated:YES];

}

//免责声明
-(void)gotoNoResponVC
{
    MeNoResponsibilityVC *responseVC = [[MeNoResponsibilityVC alloc] init];
    responseVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:responseVC animated:YES];
}

-(void)gotoLogin{
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}


#pragma mark get set
-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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
