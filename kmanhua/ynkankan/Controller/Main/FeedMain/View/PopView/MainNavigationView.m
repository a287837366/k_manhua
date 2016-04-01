//
//  MainNavigationView.m
//  ynkankan
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainNavigationView.h"
#import "AppConstant.h"

@implementation MainNavigationView

-(instancetype)init{

    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight);
        self.hidden = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchBlockView:)];
        
        [self addGestureRecognizer:tapGesture];
    }
    
    return self;
}

-(void) touchBlockView:(UIView *)view{
    [self hideNavigation:nil];
}

-(void)showNavigation:(UIView *)superView{

    [superView addSubview:self];
    
//    [UIView animateWithDuration:Ainmation_Time
//                     animations:^{
//                         _blockView.alpha = 0;
//                         _navigationBar.frame = newRect_Nav;
//                         _mainScorllView.frame = newRect_Scorll;
//                     }
//                     completion:^(BOOL finised){
//                         [choosView hasNavigationDissMiss];
//                         
//                         [_blockView removeFromSuperview];
//                         [_navigationBar removeFromSuperview];
//                         [_mainScorllView removeFromSuperview];
//                         
//                         [_mainWindow resignKeyWindow];
//                         _mainWindow = nil;
//                     }
//     ];

    
    
    self.hidden = NO;
    
}




-(void)hideNavigation:(UIView *)superView{

    self.hidden = YES;
    
    [self removeFromSuperview];
    
}

@end
