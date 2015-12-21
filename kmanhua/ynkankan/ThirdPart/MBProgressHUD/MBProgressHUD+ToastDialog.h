//
//  MBProgressHUD+ToastDialog.h
//  uniplaza
//  提示
//  Created by Xi Jin on 27/06/2015.
//  Copyright (c) 2015 YouMi. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (ToastDialog)
#pragma mark 文字提示信息方法
+(void)Toast:(UIView *)view withText:(NSString *)str;
#pragma mark 文字和等待框提示信息方法
+(void)ToastWithLoading:(UIView *)view withText:(NSString *)str;
@end
