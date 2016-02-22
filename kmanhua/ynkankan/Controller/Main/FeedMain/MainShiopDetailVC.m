//
//  MainShiopDetailVC.m
//  ynkankan
//
//  Created by aspn300 on 16/1/10.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShiopDetailVC.h"
#import "MainShopService.h"
#import "ShopDetailMainView.h"

@interface MainShiopDetailVC (){

    ShopDetailMainView *detailView;
    UIScrollView *mainScroll;

}

@property (strong, nonatomic) MainShopService *service;

@end

@implementation MainShiopDetailVC

- (void)viewDidLoad {
    NSLog(@" %@ ", self.detailModel);
    
    [super viewDidLoad];
    [self initView];
    
    [self getManById];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setTitle:[self.detailModel objectForKey:@"m_name"]];
    [self setLeftButton];
    
    mainScroll = [[UIScrollView alloc] init];
    mainScroll.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:mainScroll];
    
    detailView = [[ShopDetailMainView alloc] init];
    detailView.dataModel = self.detailModel;
    [mainScroll addSubview:detailView];
    
}

#pragma mark 返回
-(void)setLeftButton {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark 返回
-(void)closeMethod{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - 网络请求
-(void)getManById{
    
    __weak ShopDetailMainView *weakView = detailView;
    __weak UIScrollView *weakScroll = mainScroll;
    
    [self.service getManhuaById:[self.detailModel objectForKey:@"m_uid"] response:^(NSArray *viewArray, NSError *error){

        [weakView createViewByArray:viewArray];
        weakView.frame = CGRectMake(0, 0, kScreenWidth, weakView.viewHeight);
        weakScroll.contentSize = CGSizeMake(0, weakView.viewHeight);

    }];
    
}

-(MainShopService *)service{
    
    if (!_service) {
        _service = [[MainShopService alloc] init];
    }
    
    return _service;
}


@end
