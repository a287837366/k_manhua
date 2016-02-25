//
//  MeContectUsViewController.m
//  ynkankan
//
//  Created by apple on 16/1/7.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeContectUsViewController.h"

@interface MeContectUsViewController ()

@end

@implementation MeContectUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)initView{
    self.view.backgroundColor = Color_Background;
    [self setLeftButton];
    [self setTitle:@"제휴 문의"];
    
    [self.textmsg setText:@"V.1 버전: 사업 파트너나 시간 여유가 있는분들, \n앱 개발 하기 좋아하는 분들 하고 같이 완성도 높은 앱을 만들어 나가기 바랍니당.\n연락 방식 밑"];
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



@end
