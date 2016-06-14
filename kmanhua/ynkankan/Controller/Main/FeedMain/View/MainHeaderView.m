//
//  MainHeaderView.m
//  ynkankan
//
//  Created by apple on 15/12/10.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainHeaderView.h"
#import "AppConstant.h"
#import "UIImageView+WebCache.h"


#define Item_W          (kScreenWidth / 4.0f)   //一个类别的 所用的空间为 屏幕的 4分之一
#define Item_Ads_H      (kScreenWidth / 5.0f)   //广告高度 宽:高  5:1

@interface MainHeaderView(){

    UIImageView *adsImage;
    UIView *chooseView;
    
    NSMutableDictionary *imageDic;

}

@end

@implementation MainHeaderView

-(id)init{
    
    self = [super init];
    
    if(self){

        self.frame = CGRectMake(0, 0, kScreenWidth, 30 + Item_W + 7.0f);
        chooseView = [[UIView alloc] init];
        chooseView.frame = CGRectMake(0, 0, kScreenWidth, 30 + Item_W + 7.0f);
        [self initTitleView];
        [self initChooseView];
        
    }
    
    return self;
}

-(void)setDate:(NSMutableArray *)newDataArray{

}


-(void)initChooseView{
    
    CGFloat viewX = 0.0f;

    
    
    for (int i = 0; i < 4; i++) {
       
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(viewX, 30.50f, Item_W, Item_W);

        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(10, 10, Item_W - 20.0f, Item_W - 20.0f);
        button.backgroundColor = Color_ButtonColor;
        button.layer.cornerRadius = (Item_W - 20.0f) / 2.0f;
        button.tag = 100 + i;
        [button addTarget:self action:@selector(didClickType:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *fontLable = [[UILabel alloc] init];
        fontLable.frame = button.frame;
        
        fontLable.font = [UIFont boldSystemFontOfSize:28];
        fontLable.textColor = [UIColor whiteColor];
        fontLable.textAlignment = NSTextAlignmentCenter;
        
        
        switch (i) {
            case 0:
                fontLable.text = @"招";
                button.backgroundColor = Color_zhaopin;
                break;
                
            case 1:
                fontLable.text = @"职";
                button.backgroundColor = Color_qiuzhi;
                break;
                
            case 2:
                fontLable.text = @"房";
                button.backgroundColor = Color_fangcan;
                break;
                
            case 3:
                fontLable.text = @"宠";
                button.backgroundColor = Color_chongwu;
                break;
                
            default:
                break;
        }
        
        
        [view addSubview:button];
        [view addSubview:fontLable];
       
        [chooseView addSubview:view];
        
        viewX += Item_W;
    }
    [self addSubview:chooseView];

}

-(void)didClickType:(UIButton *)button{

    if (self.delegate == nil) {
        
        return;
    }
    
    [self.delegate didClickHeader:button.tag - 100 + 1];
}

/**
 * 创建标题
 */
-(void)initTitleView{
    
    UIView *titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, 30);
    
    UIView *leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 7, 3, 16);
    leftView.backgroundColor = Color_ButtonColor;
    titleView.backgroundColor = [UIColor whiteColor];
   
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(10, 0, kScreenWidth - 18, 30);
    lable.font = [UIFont systemFontOfSize:13];
    lable.textColor = Color_888888;
    lable.text = @"类别";
    
    [titleView addSubview:lable];
    [titleView addSubview:leftView];
    [chooseView addSubview:titleView];

}


-(BOOL)addAds:(NSMutableDictionary *)adsDic{
    
    if ([[adsDic objectForKey:@"image"] isEqualToString:@""]) {
        
        return false;
    }
    
    imageDic = adsDic;
    
    adsImage = [[UIImageView alloc] init];
    adsImage.frame = CGRectMake(0, 0, kScreenWidth, Item_Ads_H);
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = adsImage.frame;
    [button addTarget:self action:@selector(clickImage:) forControlEvents:UIControlEventTouchUpInside];

    [adsImage sd_setImageWithURL:[NSURL URLWithString:[adsDic objectForKey:@"image"]]];
    
    [self addSubview:adsImage];
    [self addSubview:button];
    
    //移动 选择View的
    CGRect chooseFrame = chooseView.frame;
    chooseFrame.origin.y += 3.0f + Item_Ads_H;
    chooseView.frame = chooseFrame;
//
//    //重新定义
    self.frame = CGRectMake(0, 0, kScreenWidth, 30 + Item_W + 7.0f + 3.0f + Item_Ads_H);
    
    return true;
}

- (void)clickImage:(UIButton *)button{

    
    if (self.delegate == nil) {
        return;
    }
    
    [self.delegate didClickAds:[imageDic objectForKey:@"jumpUrl"]];
    
}


@end
