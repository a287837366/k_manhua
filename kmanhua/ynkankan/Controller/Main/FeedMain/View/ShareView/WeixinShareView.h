//
//  WeixinShareView.h
//  ynkankan
//
//  Created by apple on 16/6/25.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WeixinShareViewDelegate;

@interface WeixinShareView : UIView

@property (nonatomic, assign) id<WeixinShareViewDelegate> delegate;

- (void)showShare;

@end

@protocol WeixinShareViewDelegate <NSObject>

-(void)didClickShareItem:(NSInteger)index;

@end
