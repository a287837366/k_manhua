//
//  MainShopDetailVC.m
//  ynkankan
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopDetailVC.h"
#import "DetailHeaderView.h"
#import "DetailImageCell.h"
#import "DataBaseManager.h"
#import "MainShopService.h"
#import "MJPhotoBrowser.h"
#import "UserSharePrefre.h"
#import "LoginViewController.h"

//480 : 640

@interface MainShopDetailVC ()<UIAlertViewDelegate>
{
    MainShopService *service;
    
}


@property (strong, nonatomic) DetailHeaderView *headerView;
@property (strong, nonatomic) UIScrollView *mainScollView;

@end

@implementation MainShopDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    
    [self getManhuaDetail];
}

- (void)initData{
    service = [[MainShopService alloc] init];
}

- (void)initView{
    self.view.backgroundColor = Color_Background;
    [self setTitle:@"详情"];
    [self setLeftButton];
  
    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
    
    self.headerView = [[DetailHeaderView alloc] init];
    [self.headerView.favButton addTarget:self action:@selector(checkFav:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView favButtonByUid:self.detailModel.m_uid];
    self.headerView.u_NameLable.text = self.detailModel.m_fromdata;
    self.headerView.u_TimeLable.text = self.detailModel.m_createTime;
    
    self.mainScollView = [[UIScrollView alloc] init];
    self.mainScollView.backgroundColor = [UIColor whiteColor];
    self.mainScollView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    
    
    [self.view addSubview:self.mainScollView];
    

    


}

-(void)getManhuaDetail{
    
    __weak typeof(self) weakSelf = self;

    [service getManhuaById:self.detailModel.m_uid response:^(NSMutableDictionary *manhuaDic, NSError *error){
    
        if (manhuaDic !=nil) {

            weakSelf.headerView.frame = CGRectMake(0, 0, kScreenWidth, [weakSelf.headerView getContentHeight:manhuaDic]);
            [weakSelf.headerView setContent:manhuaDic];
            
            weakSelf.mainScollView.contentSize = CGSizeMake(0, weakSelf.headerView.frame.origin.y + weakSelf.headerView.frame.size.height + 60.0f);
            [weakSelf.mainScollView addSubview:weakSelf.headerView];
            [weakSelf setCallButton];
        }
        
       
    
    }];
    
}

-(void)setCallButton{

    UIButton *callButton = [[UIButton alloc] init];
    callButton.frame = CGRectMake(20, kScreenHeight - 49, kScreenWidth - 40, 40);
    callButton.backgroundColor = [UIColor whiteColor];
    callButton.layer.borderColor = [[UIColor redColor] CGColor];
    callButton.layer.borderWidth = 0.5;
    callButton.layer.cornerRadius = 5;
    [callButton setTitle:@"拨打电话" forState:UIControlStateNormal];
    callButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [callButton setTitleColor:Color_Main forState:UIControlStateNormal];
    
    [self.view addSubview:callButton];
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


#pragma mark - AlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex == 0) {
        return;
    }
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark - Action
-(void)checkFav:(UIButton *)button
{
    
    
    if ([[UserSharePrefre sharedInstance] isLogin]) {
        
        if ([[DataBaseManager shareInstance] isFav:self.detailModel.m_uid]) {
            [[DataBaseManager shareInstance] deleteManhua:self.detailModel.m_uid];
            
        } else {
            [[DataBaseManager shareInstance] insertManhua:self.detailModel];
        }
        
        [self.headerView favButtonByUid:self.detailModel.m_uid];
        
        
    } else {
        
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"收藏需要登入" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登入", nil];
        [alerView show];
        
    }
    
    

}



@end
