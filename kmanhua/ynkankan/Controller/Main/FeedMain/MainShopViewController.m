//
//  MainShopViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/11/2.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopViewController.h"
#import "MainShopCell.h"
#import "MainHeaderView.h"

@interface MainShopViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *mainTable;
@property (strong, nonatomic) MainHeaderView *headerView;

@end

@implementation MainShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    
}

-(void)initData{
    

}

-(void)initView{
    [self.view addSubview:self.mainTable];
    self.headerView = [[MainHeaderView alloc] init];
    [self.headerView setDate];
    self.headerView.frame = CGRectMake(0, 0, kScreenWidth, self.headerView.viewHeight);

    
    self.mainTable.tableHeaderView = self.headerView;

}

#pragma mark - 设置表头
-(void)setTableHader{
    
}

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
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
//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

//表头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 20);
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(0, 0, kScreenWidth, 20);
    lable.textColor = [UIColor grayColor];
    lable.font = [UIFont systemFontOfSize:13];
    lable.text = @"---  지난 이야기  ---";
    lable.textColor = [UIColor grayColor];
    lable.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:lable];
    return view;
}

#pragma mark - get set
-(UITableView *)mainTable{

    if (!_mainTable) {
        
        _mainTable = [[UITableView alloc] init];
        _mainTable.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _mainTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mainTable.delegate = self;
        _mainTable.showsVerticalScrollIndicator = NO;
        _mainTable.showsHorizontalScrollIndicator = NO;
        _mainTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _mainTable.dataSource = self;
    }

    return _mainTable;
}

@end
