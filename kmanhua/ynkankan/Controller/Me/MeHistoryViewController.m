//
//  MeHistoryViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeHistoryViewController.h"
#import "MainShopCell.h"
#import "DataBaseManager.h"

@interface MeHistoryViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *dataArray;
    
}

@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation MeHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

-(void)initData{
    dataArray = [[NSMutableArray alloc] init];
    [dataArray addObjectsFromArray:[[DataBaseManager shareInstance] getManhuaHistroy]];
}

- (void)initView{
    [self setLeftButton];
    [self setTitle:@"收藏"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];

    [self.view addSubview:self.mainTableView];
}

#pragma mark 返回
-(void)setLeftButton {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark 返回
-(void)closeMethod{
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - tableview 代理
//返回数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"MainShopCell111";
    MainShopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[MainShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        
    }
    
    NewsModel *model = [dataArray objectAtIndex:indexPath.row];
    
    cell.titleLable.text = model.m_title;
    cell.timeLable.text = model.m_createTime;
    
    return cell;
    
}
//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



#pragma mark - get set
-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }

    return _mainTableView;
}

@end
