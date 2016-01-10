//
//  MBProgressHUD+ToastDialog.m
//  uniplaza
//  提示
//  Created by Xi Jin on 27/06/2015.
//  Copyright (c) 2015 YouMi. All rights reserved.
//

#import "MBProgressHUD+ToastDialog.h"

@implementation MBProgressHUD (ToastDialog)

#pragma mark 文字提示信息方法
+(void)Toast:(UIView *)view withText:(NSString *)str{
    
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
   // hud.labelText = NSLocalizedString(str,nil);
    hud.detailsLabelText =  NSLocalizedString(str,nil);
    hud.detailsLabelFont = [UIFont systemFontOfSize:14.0f];
    
    hud.mode = MBProgressHUDModeText;
    
    //指定距离中心点的X轴和Y轴的位置，不指定则在屏幕中间显示
    //    HUD.yOffset = 100.0f;
    //    HUD.xOffset = 100.0f;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        sleep(2.0);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}

#pragma mark 文字和等待框提示信息方法
+(void)ToastWithLoading:(UIView *)view withText:(NSString *)str{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    //hud.labelText = NSLocalizedString(str,nil);
    hud.detailsLabelText = NSLocalizedString(str,nil);
}
@end
