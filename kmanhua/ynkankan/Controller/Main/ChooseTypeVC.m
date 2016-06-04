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
#import "ChooseTypeMainView.h"
#import "MainShopDetailVC.h"
#import "UserSharePrefre.h"
#import "EmptyView.h"
#import "LoginViewController.h"

@interface ChooseTypeVC () <MainCreateNewsVCDelegate, ChooseTypeMainViewDelegate, EmptyViewDelegate>
{
    ChooseTypeMainView *mainView;
    EmptyView *emptyView;
}

@end

@implementation ChooseTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];

}

- (void)viewWillAppear:(BOOL)animated{

    if (![[UserSharePrefre sharedInstance] isLogin]) {

        if (emptyView == nil) {
            [self initEmptyView];
        }
        
    } else {
        
        if (mainView == nil) {
            [self initMainView];
        }
    
    }
    
}

- (void)initData{

}

- (void)initView{
    
    self.navigationItem.title = @"发布";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];

//    [self initMainView];
}

-(void)initMainView{

    mainView = [[ChooseTypeMainView alloc] init];
    mainView.delegate = self;
    mainView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 114);
    [self.view addSubview:mainView];

    if (emptyView != nil) {
        
        [emptyView removeFromSuperview];
        emptyView = nil;
        
    }
    
}

-(void)initEmptyView{

    emptyView = [[EmptyView alloc] init];
    emptyView.delegate = self;
    [self.view addSubview:emptyView];
    
    if (mainView != nil) {
        
        [mainView removeFromSuperview];
        mainView = nil;
        
    }

}

#pragma mark - 确认按钮
-(void)clickBotton:(UIButton *)button{

    [self gotoCreateVC];
    
}


#pragma mark - didCreate
-(void)didSuccessCreate{
//    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - MainViewDelegate
-(void)didClickConfrim{

    [self gotoCreateVC];
}

#pragma mark - EmptyDelegate
-(void)didClickEmpty{
    [self gotoLogin];
}

#pragma mark - goto
-(void)gotoCreateVC{
    
//    MainShopDetailVC *detailVC = [[MainShopDetailVC alloc] init];
//    detailVC.detailModel = nil;
//    detailVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:detailVC animated:YES];
    
    MainCreateNewsVC *createVC = [[MainCreateNewsVC alloc] init];
    createVC.delegate = self;
    createVC.newsType = [mainView getCurrentIndex];
    createVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:createVC animated:YES];
}

-(void)gotoLogin{

    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
