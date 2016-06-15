//
//  MainShopDetailVC.m
//  ynkankan
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopDetailVC.h"
#import "MainShopDetailView.h"
#import "DetailImageCell.h"
#import "DataBaseManager.h"
#import "MainShopService.h"
#import "MJPhotoBrowser.h"
#import "UserSharePrefre.h"
#import "LoginViewController.h"
#import "MBProgressHUD+ToastDialog.h"

//480 : 640

@interface MainShopDetailVC ()<UIAlertViewDelegate, UIActionSheetDelegate>
{
    MainShopService *service;
    NSArray *phoneArray;
    
}

@property (strong, nonatomic) MainShopDetailView *detailView;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UIButton *saveButton;

@end

@implementation MainShopDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    
    [self getManhuaDetail];
}

- (void)initData{
    
    phoneArray = [self.detailModel.u_phoneno componentsSeparatedByString:@";"];
    service = [[MainShopService alloc] init];

}

- (void)initView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setTitle:@"详情"];
    
    [self initBackButton];
    [self initMainView];
    [self initBottomView];
}

- (void)initMainView {

    self.detailView = [[MainShopDetailView alloc] init];
    [self.view addSubview:self.detailView];
}

- (void)initBottomView {

    self.bottomView = [[UIView alloc] init];
    self.bottomView.frame = CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50);
    
    self.saveButton = [[UIButton alloc] init];
    self.saveButton.frame = CGRectMake(0, 0, kScreenWidth/ 2.0f, 50);
    [self.saveButton setBackgroundColor:Color_zhaopin];
    self.saveButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.saveButton setTitle:@"收藏" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    UIButton *callButton = [[UIButton alloc] init];
    callButton.frame = CGRectMake(kScreenWidth / 2.0f, 0, kScreenWidth/ 2.0f, 50);
    [callButton setBackgroundColor:Color_qiuzhi];
    callButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [callButton setTitle:@"拨打电话" forState:UIControlStateNormal];
    [callButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.bottomView addSubview:self.saveButton];
    [self.bottomView addSubview:callButton];
    [self.view addSubview:self.bottomView];
}

-(void)getManhuaDetail{
    
    __weak typeof(self) weakSelf = self;

    [service getManhuaById:self.detailModel.m_uid response:^(NSMutableDictionary *manhuaDic, NSError *error){
    
        if (manhuaDic !=nil) {
            
            NSLog(@" %@ ", manhuaDic);
            
            [weakSelf.detailView setContentByDic:manhuaDic newsModel:self.detailModel];
        
        } else {
        
            [weakSelf showDeleteAlert];
        
        }
        
       
    
    }];
    
}

-(void)showDeleteAlert{

    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"改消息已被删除" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alerView show];

    
}

-(void)clickCallButton:(UIButton *)button{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:nil];

    for (NSString *btnString in phoneArray) {
        [actionSheet addButtonWithTitle:btnString];
    }
    
    [actionSheet showInView:self.view];


}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex == 0) {
        return;
    }
    
    NSLog(@">>>>>>>>%@", phoneArray[buttonIndex - 1]);

}

#pragma mark 返回
- (void)initBackButton {
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

    } else {
        
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏需要登入" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登入", nil];
        [alerView show];
        
    }
    
    

}



@end
