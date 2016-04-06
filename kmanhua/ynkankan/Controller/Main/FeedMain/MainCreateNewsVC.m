//
//  MainCreateNewsVC.m
//  ynkankan
//
//  Created by aspn300 on 16/4/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainCreateNewsVC.h"
#import "MainCreateMainView.h"
#import "AmPhotoPikerViewController.h"

@interface MainCreateNewsVC ()<MainCreateMainViewDelegate>
{

    MainCreateMainView *mainView;

}

@end

@implementation MainCreateNewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
 
}

-(void)initView{
    
    mainView = [[MainCreateMainView alloc] init];
    mainView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    mainView.delegate = self;
    [self.view addSubview:mainView];

}

#pragma mark - MainCreateMainViewDelegate
-(void)gotoSelectPhoto{
    
    AmPhotoPikerViewController *viewC = [[AmPhotoPikerViewController alloc] init];
    
    viewC.maxCount = 9;
    [self presentViewController:viewC animated:YES completion:nil];
    
}

#pragma mark - Action
- (IBAction)clickCancle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
