    //
//  NewsWebDetialViewController.m
//  ynkankan
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "NewsWebDetialViewController.h"

@interface NewsWebDetialViewController ()

@property (strong, nonatomic) UIWebView *mainWebView;

@end

@implementation NewsWebDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.

}

- (void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainWebView];
    [self setLeftButton];
    [self setTitle:@" 남자 남자 "];
}

-(void)viewWillAppear:(BOOL)animated{
    [self loadWebView];
}

-(void)loadWebView{
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mp.weixin.qq.com/s?__biz=MzA3ODM5NDI2Mw==&mid=400894297&idx=3&sn=f59eba13766667b47339ef33b422504f#rd"]];
    [self.mainWebView loadRequest:request];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark get set
-(UIWebView *)mainWebView{

    if(!_mainWebView){
        _mainWebView = [[UIWebView alloc] init];
        _mainWebView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    }

    return _mainWebView;
}

@end