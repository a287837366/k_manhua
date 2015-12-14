//
//  RegisterViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterdDetailView.h"

@interface RegisterViewController ()

@property (strong, nonatomic) RegisterdDetailView *detailView;
@property (strong, nonatomic) UIScrollView *mainScollView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.mainScollView];
    [self createView];
    [self.mainScollView addSubview:self.detailView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Action
- (IBAction)clickCancle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickResiger{
    [self.delegate registeSuccess];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - View
-(void)createView{
    self.detailView = [[[NSBundle mainBundle] loadNibNamed:@"RegisterdDetailView" owner:self options:nil] lastObject];
    self.detailView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
    [self.detailView.btnCenter addTarget:self action:@selector(clickResiger) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - get set
-(UIScrollView *)mainScollView{

    if (!_mainScollView) {
        
        _mainScollView = [[UIScrollView alloc] init];
        _mainScollView.frame = CGRectMake(0, 66, kScreenWidth, kScreenWidth - 66);
        
    }

    return _mainScollView;
}

@end
