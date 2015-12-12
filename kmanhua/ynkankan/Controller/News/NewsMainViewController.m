//
//  NewsMainViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/9/17.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "NewsMainViewController.h"
#import "NewsMainViewCell.h"

@interface NewsMainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation NewsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self initView];
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

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"NewsMainViewCell";
    NewsMainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[NewsMainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.rightImageView.image = [UIImage imageNamed:@"test_3"];
    cell.titleLable.text = @"남자가 성공 할수 이유는 자기가 멋있느것이 아니라";
    cell.fromLable.text = @"심심풀이 땅콩으로 부터";
    cell.timeLable.text = @"1일전";
    
    return cell;
}

//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
        
    }

    return _mainTableView;
}


@end
