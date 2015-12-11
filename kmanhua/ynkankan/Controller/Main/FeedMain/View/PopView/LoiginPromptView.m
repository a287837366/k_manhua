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

#define popView_Weight (kScreenWidth - 160)

@interface LoiginPromptView(){
  
    
    UIWindow *mainWindow;
   
    UIView *blockView;
    
    UIView *contentView;
}

@property (nonatomic, strong) UIView *contentView;

@end


@implementation LoiginPromptView

-(id)init{

    self = [super init];
    
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
    [self dissMissAlert];
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
                        self.contentView.alpha = 1;
                        self.contentView.frame = CGRectMake(80 , (kScreenHeight - 200) / 2 - 75, kScreenWidth - 160 , kScreenHeight - 350);
                     }
                     completion:^(BOOL finised){
                         
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
        
        UILabel *lable = [[UILabel alloc] init];
        lable.frame = CGRectMake(0, 10, popView_Weight, 30);
        lable.text = @"-- 주의사항 --";
        lable.textColor = Color_Main;
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:15];
        
        [_contentView addSubview:lable];

    }
    
    
    return _contentView;
}

@end
