//
//  RegisterViewController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    baseInfoView = [[[NSBundle mainBundle] loadNibNamed:@"MeOrderBaseInfoView" owner:self options:nil] lastObject];
//    [baseInfoView createBuyerView:_orderModel delegate:self y:0];
//    [_mainScrollView addSubview:baseInfoView];
  
}

- (void)initView{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Action
- (IBAction)clickCancle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
