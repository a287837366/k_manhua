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

@interface MeViewController ()<UITableViewDataSource, UITableViewDelegate>{

    NSMutableArray *dataArray;

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
    dataArray = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects:@"방문기록", @"의견제출 하기 ", @"제휴문의", @"땐짠 하기", nil], [[NSMutableArray alloc] initWithObjects:@"웨이씬 공유하기", @"About Us", nil], nil];
}

- (void)initView{
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    backgoundView.backgroundColor = Color_Background;
    [self.view addSubview:backgoundView];
    
    [self settingTableHeader];
    [self.view addSubview:self.mainTableView];
    [self setTitle:@"나의"];
    
    
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
//表头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 10);
    view.backgroundColor = Color_Background;
    
    return view;
}

#pragma mark get set
-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.frame = CGRectMake(10, 64, kScreenWidth - 20, kScreenHeight - 114);
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
