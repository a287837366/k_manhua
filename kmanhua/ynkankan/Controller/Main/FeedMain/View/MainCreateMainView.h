//
//  MainCreateMainView.h
//  ynkankan
//
//  Created by aspn300 on 16/4/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainCreateMainViewDelegate;

@interface MainCreateMainView : UIView

@property (weak, nonatomic) id<MainCreateMainViewDelegate> delegate;

@end


@protocol MainCreateMainViewDelegate <NSObject>

-(void)gotoSelectPhoto;

@end
