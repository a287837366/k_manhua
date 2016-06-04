//
//  ChooseTypeMainView.h
//  ynkankan
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChooseTypeMainViewDelegate;

@interface ChooseTypeMainView : UIView

@property (weak, nonatomic) id<ChooseTypeMainViewDelegate> delegate;

-(NSInteger)getCurrentIndex;

@end

@protocol ChooseTypeMainViewDelegate <NSObject>

-(void)didClickConfrim;

@end
