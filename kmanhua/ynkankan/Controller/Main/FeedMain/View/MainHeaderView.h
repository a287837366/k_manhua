//
//  MainHeaderView.h
//  ynkankan
//
//  Created by apple on 15/12/10.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//
//  控制主页面的 上面部分

#import <UIKit/UIKit.h>

@protocol MainHeaderDelegate;

@interface MainHeaderView : UIView

/*
 * 整个Header的高度
 */
@property (nonatomic, assign) CGFloat viewHeight;

/*
 * 添加广告
 * @param:广告属性 key -> jumpurl:跳转, imageUrl:首页图片
 */
-(void)addAds:(NSMutableDictionary *)adsDic;

@property (nonatomic, weak) id<MainHeaderDelegate> delegate;

@end

@protocol MainHeaderDelegate <NSObject>

/**
 * Header的点击事件
 * @param index:类别
 */
-(void)didClickHeader:(NSInteger)index;

/**
 * Header的点击广告部分
 * @param jumpUrl:跳转的网址
 */
-(void)didClickAds:(NSString *)jumpUrl;

@end
