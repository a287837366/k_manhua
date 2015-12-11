//
//  LoiginPromptView.m
//  ynkankan
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "LoiginPromptView.h"
#import "AppConstant.h"

#define Ainmation_Time  0.4

#define popView_Weight 215.000000
#define popView_Height 317.000000

@interface LoiginPromptView(){
  
    
    UIWindow *mainWindow;
   
    UIView *blockView;
    
    UILabel *titleLable;
    
    UIButton *loginButton;
    
    UILabel *contentLable;
}

@property (nonatomic, strong) UIView *contentView;

@end


@implementation LoiginPromptView

-(id)init{

    self = [super init];
    NSLog(@"  %f    %f ", popView_Weight,  kScreenHeight - 350);
    if (self) {
        blockView = [[UIView alloc] init];
        blockView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        blockView.backgroundColor = [UIColor blackColor];
        blockView.alpha = 0;
        
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchBlockView:)];
        [blockView addGestureRecognizer:tapGesture];
    }

    return self;
}

#pragma mark - Action
//点击阴影
-(void)touchBlockView:(UIView *)view{
    [self titleDissMissAnimation];
}

#pragma mark - 动作
- (void)showNavigation{
    NSLog(@"  showNavigation  ");
    
    mainWindow = [[UIWindow alloc] init];
    mainWindow.backgroundColor = [UIColor clearColor];
    mainWindow.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    [mainWindow addSubview:blockView];
    [mainWindow addSubview:self.contentView];
    [mainWindow makeKeyAndVisible];
    
    [UIView animateWithDuration:Ainmation_Time
                     animations:^{
                        blockView.alpha = 0.3;
                        titleLable.frame = CGRectMake(0, 10, popView_Weight, 30);
                      
                        self.contentView.alpha = 1;
                        self.contentView.frame = CGRectMake(80 , (kScreenHeight - popView_Height) / 2 - 25, popView_Weight , popView_Height);
                     }
                     completion:^(BOOL finised){
                         [self titleShowAnimation];
                     }
     ];
    
}

- (void)titleShowAnimation{

    [UIView animateWithDuration:Ainmation_Time
                     animations:^{
                         titleLable.alpha = 1;
                         loginButton.alpha = 1;
                         contentLable.alpha = 1;
                     }
                     completion:^(BOOL finised){
                         
                     }
     ];
    
}

- (void)titleDissMissAnimation{
    [UIView animateWithDuration:0.2
                     animations:^{
                         titleLable.alpha = 0;
                         loginButton.alpha = 0;
                         contentLable.alpha = 0;
                     }
                     completion:^(BOOL finised){
                         [self dissMissAlert];
                     }
     ];
}

- (void)dissMissAlert{

    [UIView animateWithDuration:Ainmation_Time
                     animations:^{
                         
                         blockView.alpha = 0;
                         self.contentView.alpha = 0;
                         self.contentView.frame = CGRectMake(kScreenWidth / 2, kScreenHeight / 2, 0, 0);

                     }
                     completion:^(BOOL finised){
                         
                         [blockView removeFromSuperview];
                         blockView = nil;
                         
                         [mainWindow resignKeyWindow];
                         mainWindow = nil;
                         
                         [self.contentView removeFromSuperview];
                         self.contentView = nil;
                        
                         [self removeFromSuperview];
                         
                     }
     ];
    
    
}

-(UIView *)contentView {

    if(!_contentView){
        
        _contentView = [[UIView alloc] init];
        _contentView.frame = CGRectMake(kScreenWidth / 2, kScreenHeight / 2, 0, 0);
        _contentView.alpha = 0;
        
        _contentView.backgroundColor = Color_fcfcfc;
        _contentView.layer.borderColor = [[UIColor colorWithRed:252/255.0f green:21/255.0f blue:115/255.0f alpha:1] CGColor];
        _contentView.layer.borderWidth = 3;
        
        _contentView.layer.cornerRadius = 10;
        _contentView.layer.masksToBounds = YES;
        
        titleLable = [[UILabel alloc] init];
        titleLable.frame = CGRectMake(0, 10, popView_Weight, 30);
        titleLable.text = @"-- 주의사항 --";
        titleLable.textColor = Color_Main;
        titleLable.alpha = 0;
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.font = [UIFont systemFontOfSize:15];
        
        
        contentLable = [[UILabel alloc] init];
        contentLable.frame = CGRectMake(5, 40, popView_Weight - 10, popView_Height - 40 - 40);
        contentLable.textColor = Color_666666;
        contentLable.text = @" 1. *17 반드시 로그인하여야 볼수 있음 \n\n 2.본 앱에서 로그인 대한 정보를 노출안함 \n\n 3.저희 로그인은 앱으의 활성도에 대한 용도에만 사용하고 다른데 사용안함을 기필코 맹세";
        contentLable.font = [UIFont systemFontOfSize:13];
        contentLable.numberOfLines = 0;
        contentLable.alpha = 0;
        
        
        loginButton = [[UIButton alloc] init];
        loginButton.layer.cornerRadius = 5;
        loginButton.alpha = 0;
        loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
        loginButton.layer.masksToBounds = YES;
        [loginButton setTitle:@"로그인하기" forState:UIControlStateNormal];
        [loginButton setTitleColor:Color_fcfcfc forState:UIControlStateNormal];
        loginButton.frame = CGRectMake(10, popView_Height - 40, popView_Weight - 20, 30);
        loginButton.backgroundColor = Color_Main;
        
        [_contentView addSubview:contentLable];
        [_contentView addSubview:loginButton];
        [_contentView addSubview:titleLable];

    }
    
    
    return _contentView;
}

@end
