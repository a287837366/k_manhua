//
//  MainHeaderView.h
//  ynkankan
//
//  Created by apple on 15/12/10.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainHeaderDelegate;

@interface MainHeaderView : UIView

@property (nonatomic, assign) CGFloat viewHeight;

@property (nonatomic, weak) id<MainHeaderDelegate> delegate;

-(void)setDate:(NSMutableArray *)newDataArray;

@end

@protocol MainHeaderDelegate <NSObject>

-(void)didClickHeader:(NSInteger)index;

@end
