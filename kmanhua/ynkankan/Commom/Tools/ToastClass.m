//
//  ToastClass.m
//  ynkankan
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "ToastClass.h"

@implementation ToastClass

+(void)showToastTo:(NSInteger)time msg:(NSString *)msg{
    [[UIApplication sharedApplication].keyWindow addSubview:[ToastClass createToastView]];
}


+(UIView *)createToastView{
    UIView *view = [[UIView alloc] init];
   
    view.backgroundColor = [UIColor blackColor];
    view.frame = CGRectMake(0, 100, 100, 100);
    
    return view;
}

@end
