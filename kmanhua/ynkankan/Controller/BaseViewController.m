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
    
    [self initNavigation];
}

- (void)initNavigation{
    
//    UIImageView *naviImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_top_background"]];
//    naviImageView.frame = CGRectMake(0, -20, kScreenWidth, 64);
//    [self.navigationController.navigationBar addSubview:naviImageView];
//    [self.navigationController.navigationBar sendSubviewToBack:naviImageView];
//    
//    
//    CGRect rect = CGRectMake(0, -20, kScreenWidth, 64);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rect);
//    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.clipsToBounds = NO;
    
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:Color_666666, NSForegroundColorAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setTintColor:Color_666666];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
