//
//  WeixinShareView.m
//  ynkankan
//
//  Created by apple on 16/6/25.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "WeixinShareView.h"
#import "AppConstant.h"

@interface WeixinShareView() {

    UIWindow *mainWindow;
    UIView *blockView;
    
}

@end

@implementation WeixinShareView

- (instancetype) init {

    if (self = [super init]) {
        
        blockView = [[UIView alloc] init];
        blockView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        blockView.backgroundColor = [UIColor blackColor];
        blockView.alpha = 0.4;
        
    }

    return self;
}

- (void)showShare {
    
    mainWindow = [[UIWindow alloc] init];
    mainWindow.backgroundColor = [UIColor clearColor];
    mainWindow.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    [mainWindow addSubview:blockView];
    [mainWindow makeKeyAndVisible];

}

@end


