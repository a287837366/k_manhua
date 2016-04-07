//
//  MainNavigationView.h
//  ynkankan
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,NewsType){
    NewsTypeAll = 0,      //全部
    NewsTypeZhaopin,
    NewsTypeQiuzhi,
    NewsTypeFangdican,
    NewsTypeChongwu
};

@protocol MainNavigationViewDelegate;

@interface MainNavigationView : UIView

@property (nonatomic, weak) id<MainNavigationViewDelegate> delegate;

-(void)showNavigation:(UIView *)superView;
-(void)hideNavigation:(UIView *)superView;

-(NewsType)getType;


@end

@protocol MainNavigationViewDelegate <NSObject>

-(void)didClickTypeByType:(NewsType)type;


@end
