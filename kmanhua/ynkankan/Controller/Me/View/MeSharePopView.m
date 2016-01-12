//
//  MeSharePopView.m
//  ynkankan
//
//  Created by apple on 16/1/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeSharePopView.h"
#import "AppConstant.h"

#define Ainmation_Time  0.4


@interface MeSharePopView(){

    UIButton *blockView;
    UIWindow *mainWindow;
    UIView *shareView;
    
}


@end

@implementation MeSharePopView

-(id)init{

    self = [super init];
    
    if (self) {
        
        blockView = [[UIButton alloc] init];
        blockView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        blockView.backgroundColor = [UIColor blackColor];
        blockView.alpha = 0;
        
        [blockView addTarget:self action:@selector(touchBlockView1:) forControlEvents:UIControlEventTouchUpInside];
        
        [self createShareView];
        
    }
    
    return self;

}

-(void)show{
    
    mainWindow = [[UIWindow alloc] init];
    mainWindow.backgroundColor = [UIColor clearColor];
    mainWindow.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    [mainWindow addSubview:blockView];
    [mainWindow addSubview:shareView];
    [mainWindow makeKeyAndVisible];
    
    [UIView animateWithDuration:Ainmation_Time
                     animations:^{
                         blockView.alpha = 0.4;
                         shareView.frame = CGRectMake(0, kScreenHeight - 170, kScreenWidth, 170);
                     }
                     completion:^(BOOL finised){

                     }
     ];
}


#pragma mark - 创建
-(void)createShareView{

    shareView = [[UIView alloc] init];
    shareView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 170);
    shareView.backgroundColor = [UIColor whiteColor];
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, 40, kScreenWidth, 1);
    lineView.backgroundColor = Color_eeeeee;
    [shareView addSubview:lineView];
    
    UIButton *cancleButton = [[UIButton alloc] init];
    cancleButton.frame = CGRectMake(kScreenWidth - 36, 7, 26, 26);
    cancleButton.alpha = 0.5;
    [cancleButton addTarget:self action:@selector(touchBlockView1:) forControlEvents:UIControlEventTouchUpInside];
    [cancleButton setBackgroundImage:[UIImage imageNamed:@"me_weixin_cancle"] forState:UIControlStateNormal];
    [shareView addSubview:cancleButton];
    
    UIButton *memontBtn = [[UIButton alloc] init];
    memontBtn.frame = CGRectMake(20, 65, 60, 60);
    [memontBtn setImage:[UIImage imageNamed:@"me_weixin_group"] forState:UIControlStateNormal];
    [shareView addSubview:memontBtn];
    
    
    UIButton *weixinFriendBtn = [[UIButton alloc] init];
    weixinFriendBtn.frame = CGRectMake(100, 65, 60, 60);
    [weixinFriendBtn setImage:[UIImage imageNamed:@"me_weixin_share"] forState:UIControlStateNormal];
    [shareView addSubview:weixinFriendBtn];
}

#pragma mark - Action
//点击阴影
-(void)touchBlockView1:(UIButton *)button{
    NSLog(@"touchBlockView");
    [UIView animateWithDuration:Ainmation_Time
                     animations:^{
                        blockView.alpha = 0;
                        shareView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 260);
                     }
                     completion:^(BOOL finised){
                         [blockView removeFromSuperview];
                         blockView = nil;
                         
                         [shareView removeFromSuperview];
                         shareView = nil;
                         
                         [mainWindow resignKeyWindow];
                         mainWindow = nil;
                         
                        [self removeFromSuperview];
                     }
     ];

    
}

@end
