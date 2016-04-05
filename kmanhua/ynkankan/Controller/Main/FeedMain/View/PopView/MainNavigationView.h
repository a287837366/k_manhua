//
//  MainNavigationView.h
//  ynkankan
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainNavigationViewDelegate;

@interface MainNavigationView : UIView

@property (nonatomic, weak) id<MainNavigationViewDelegate> delegate;

-(void)showNavigation:(UIView *)superView;
-(void)hideNavigation:(UIView *)superView;

@end

@protocol MainNavigationViewDelegate <NSObject>

-(void)didClickTypeByType:(NSInteger)type;

@end
