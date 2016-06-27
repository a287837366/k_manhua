//
//  WeixinShareView.m
//  ynkankan
//
//  Created by apple on 16/6/25.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "WeixinShareView.h"
#import "AppConstant.h"


#define Ainmation_Time  0.25

#define ContentView_H   150

@interface WeixinShareView() {

}

@property (strong, nonatomic) UIWindow *mainWindow;
@property (strong, nonatomic) UIView *blockView;
@property (strong, nonatomic) UIView *contentView;

@end

@implementation WeixinShareView

- (instancetype) init {

    if (self = [super init]) {
        
        self.blockView = [[UIView alloc] init];
        self.blockView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.blockView.backgroundColor = [UIColor blackColor];
        self.blockView.alpha = 0.0;
        
        [self initContentView];
        
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchBlockView:)];
//        [self.blockView addGestureRecognizer:tapGesture];
        
    }

    return self;
}


- (void)initContentView {

    self.contentView = [[UIView alloc] init];
    self.contentView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, ContentView_H);
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.frame = CGRectMake(0, 0, kScreenWidth, 29);
    titleLable.font = [UIFont systemFontOfSize:13];
    titleLable.textColor = [UIColor grayColor];
    titleLable.text = @"分享内容至";
    titleLable.textAlignment = NSTextAlignmentCenter;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, 30, kScreenWidth, 1);
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    for (int i = 0; i < 2; i ++) {
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(i * 80, 30, 80, 80);
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(20, 13, 40, 40);
        
        UILabel *shareLable = [[UILabel alloc] init];
        shareLable.frame = CGRectMake(0, 53, 80, 25);
        shareLable.font = [UIFont systemFontOfSize:12];
        shareLable.textColor = [UIColor grayColor];
        shareLable.textAlignment = NSTextAlignmentCenter;
        
        UIButton *clickButton = [[UIButton alloc] init];
        clickButton.frame = CGRectMake(0, 0, 80, 80);
        clickButton.tag = 100 + i;
        [clickButton addTarget:self action:@selector(clickShareItem:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            imageView.image = [UIImage imageNamed:@"wechat_friend"];
            shareLable.text = @"微信好友";
            
        } else {
            
            imageView.image = [UIImage imageNamed:@"wechat_group"];
            shareLable.text = @"朋友圈";
        }
        
        [view addSubview:clickButton];
        [view addSubview:imageView];
        [view addSubview:shareLable];
        [self.contentView addSubview:view];
    }
    
    

    UIButton *cancleButton = [[UIButton alloc] init];
    cancleButton.frame = CGRectMake(0, ContentView_H - 40, kScreenWidth, 40);
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(touchBlockView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.frame = CGRectMake(0, ContentView_H - 40, kScreenWidth, 1);
    lineView2.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self.contentView addSubview:titleLable];
    [self.contentView addSubview:lineView];
    [self.contentView addSubview:cancleButton];
    [self.contentView addSubview:lineView2];
}

- (void)clickShareItem:(UIButton *)button{

    if (self.delegate == nil) {
        
        return;
    }
    
    [self.delegate didClickShareItem:button.tag - 100];
    [self dissMiss];
}

-(void)touchBlockView:(UIButton *)button{
    NSLog(@"  关闭  ");
    [self dissMiss];
}

- (void)showShare {
    
    self.mainWindow = [[UIWindow alloc] init];
    self.mainWindow.backgroundColor = [UIColor clearColor];
    self.mainWindow.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    [self.mainWindow addSubview:self.blockView];
    [self.mainWindow addSubview:self.contentView];
    [self.mainWindow makeKeyAndVisible];
    
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:Ainmation_Time
                     animations:^{
                        
                         weakSelf.blockView.alpha = 0.3;
                         weakSelf.contentView.frame = CGRectMake(0, kScreenHeight - ContentView_H, kScreenWidth, ContentView_H);
                     }
                     completion:^(BOOL finised){

                     }
     ];

}

-(void) dissMiss {

    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:Ainmation_Time
                     animations:^{
                         
                         weakSelf.blockView.alpha = 0;
                         weakSelf.contentView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, ContentView_H);
                         
                     }
                     completion:^(BOOL finised){
                         
                         [weakSelf.mainWindow resignKeyWindow];
                         weakSelf.mainWindow = nil;
                         
                         [self removeFromSuperview];
                         
                     }
     ];
    
}

@end


