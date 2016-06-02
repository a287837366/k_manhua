//
//  ChooseTypeVC.m
//  ynkankan
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "ChooseTypeVC.h"
#import "AppConstant.h"
#import "ChooseTypeCell.h"
#import "MainCreateNewsVC.h"


@interface ChooseTypeVC () <MainCreateNewsVCDelegate>
{

    NSInteger selctionIndex;
    
}

@end

@implementation ChooseTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];

}

- (void)initData{
    selctionIndex = 0;
}

- (void)initView{
    
    self.navigationItem.title = @"发布";
    
//    [self setTitle:@"选择类别"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
//    [self initBottomButton];
//    [self setLeftButton];
    
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

- (void)initBottomButton {

    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(15, kScreenHeight - 50, kScreenWidth - 30, 40);
    button.backgroundColor = Color_ButtonColor;
    button.layer.cornerRadius = 5.0f;
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickBotton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 确认按钮
-(void)clickBotton:(UIButton *)button{

    [self gotoCreateVC];
    
}


#pragma mark - didCreate
-(void)didSuccessCreate{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tableViewDelegate

#pragma mark - goto
-(void)gotoCreateVC{
    MainCreateNewsVC *createVC = [[MainCreateNewsVC alloc] init];
    createVC.delegate = self;
    createVC.newsType = selctionIndex + 1;
    [self.navigationController pushViewController:createVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
