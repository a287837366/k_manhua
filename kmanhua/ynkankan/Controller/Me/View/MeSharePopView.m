//
//  MeSharePopView.m
//  ynkankan
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeSharePopView.h"
#import "AppConstant.h"


@interface MeSharePopView(){

    UIView *blockView;
    UIWindow *mainWindow;
    
}



@end

@implementation MeSharePopView

-(id)init{

    self = [super init];
    
    if (self) {
        
        blockView = [[UIView alloc] init];
        blockView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        blockView.backgroundColor = [UIColor blackColor];
        blockView.alpha = 0;

    }
    
    return self;

}

-(void)show{
    UIView *view = [UIApplication sharedApplication].keyWindow;

    blockView.alpha = 0.3;
    [view addSubview:blockView];
    
}



@end
