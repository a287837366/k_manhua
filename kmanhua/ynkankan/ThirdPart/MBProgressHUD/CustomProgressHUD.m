//
//  CustomProgressHUD.m
//  uniplaza
//  自定义等待框
//  Created by Xi Jin on 16/07/2015.
//  Copyright (c) 2015 YouMi. All rights reserved.
//

#import "CustomProgressHUD.h"

#define kLoading @"loading"
#define kLoadingCount 12

@implementation CustomProgressHUD

#pragma mark 获取HUD View
+(instancetype)getHudView:(UIView *)view{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    if (view.subviews == nil) return nil;
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (CustomProgressHUD *)subview;
        }
    }
    return nil;
}

#pragma mark 隐藏等待框
+(void)hideHUD:(UIView *)view {
    CustomProgressHUD *hud = [self getHudView:view];
    
    if (hud == nil)
        return;
    if(!hud.img.isAnimating)
        return;
    
    [hud removeFromSuperview];
    //停止动画
    [hud.img stopAnimating];
    //清理缓存
    hud.img.animationImages =nil;
}

#pragma mark 显示等待框
+ (instancetype)showHUD:(UIView *)view {
    CustomProgressHUD *hud = [[self alloc] initWithView:view];
    [view bringSubviewToFront:hud];
    return hud;
}

#pragma mark 初始化视图并开始动画
-(instancetype)initWithView:(UIView *)view {
    CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.cover = [[UIView alloc]initWithFrame:frame];
        
        //半透明背景
        self.cover.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        self.cover.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.cover];
        
        //等待框
        self.img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        [self.img setCenter:self.cover.center];
        [self.cover addSubview:self.img];
        [view addSubview:self];
        
        // 动画图片的数组
        NSMutableArray *animArray = [NSMutableArray array];
        
        // 添加动画播放的图片
        for (int i = 1; i <= kLoadingCount; i++) {
            // 图像名称
            NSString *imageName = [NSString stringWithFormat:@"%@_%d@2x.png", kLoading, i];
            NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
            UIImage *image = [UIImage imageWithContentsOfFile:path];
            [animArray addObject:image];
        }
        
        self.img.animationImages = animArray;
        // 3.设置播放时间
        self.img.animationDuration = kLoadingCount * 0.08;
        [self.img startAnimating];
    }
    return self;
}
@end
