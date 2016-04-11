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

@interface MeHistoryViewController ()
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
}

- (void)initView{
    [self setLeftButton];
    [self setTitle:@"收藏"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
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

#pragma mark - get set
-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    }

    return _mainTableView;
}

@end
