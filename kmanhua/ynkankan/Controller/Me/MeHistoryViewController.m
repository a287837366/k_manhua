//
//  MeHistoryViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeHistoryViewController.h"

@interface MeHistoryViewController ()

@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation MeHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *backgoundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 110)];
    backgoundView.backgroundColor = Color_Background;
    [self.view addSubview:backgoundView];
    
//    [self.view addSubview:self.mainTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - get set
-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.frame = CGRectMake(10, 64, kScreenWidth - 20, kScreenHeight - 64);
    }

    return _mainTableView;
}

@end
