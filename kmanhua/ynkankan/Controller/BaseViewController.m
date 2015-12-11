//
//  BaseViewController.m
//  ynkankan
//
//  Created by aspn300 on 15/9/17.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "BaseViewController.h"


#define Screen_Weight [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initNavigation{
    
    
    [self.navigationController.navigationBar setBarTintColor:Color_fcfcfc];
    [self.navigationController.navigationBar setTintColor:Color_666666];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
