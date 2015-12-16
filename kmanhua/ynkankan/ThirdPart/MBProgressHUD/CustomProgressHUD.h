//
//  CustomProgressHUD.h
//  uniplaza
//  自定义等待框
//  Created by Xi Jin on 16/07/2015.
//  Copyright (c) 2015 YouMi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"

@interface CustomProgressHUD : UIView
@property (strong, nonatomic) UIView * cover;
@property (strong, nonatomic) UIImageView * img;

#pragma mark 显示等待框
+ (instancetype)showHUD:(UIView *)view;
#pragma mark 隐藏等待框
+(void)hideHUD:(UIView *)view;
@end
