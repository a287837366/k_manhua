//
//  EmptyView.h
//  ynkankan
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmptyViewDelegate;

@interface EmptyView : UIView

@property (weak, nonatomic) id<EmptyViewDelegate> delegate;

-(void)setEmptyMsg:(NSString *)msg;

@end

@protocol EmptyViewDelegate <NSObject>

-(void)didClickEmpty;

@end
