//
//  LoiginPromptView.h
//  ynkankan
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoiginPromptViewDelegate;

@interface LoiginPromptView : UIView

@property (weak) id<LoiginPromptViewDelegate> delegate;

-(void)showNavigation;

@end

@protocol LoiginPromptViewDelegate <NSObject>

-(void)didClickLogin;

@end
