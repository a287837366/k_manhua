//
//  MainBaseManhuaView.h
//  ynkankan
//
//  Created by apple on 16/2/27.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainBaseManhuaView : UIView

@property (strong, nonatomic) UIView *lineView;

@property (strong, nonatomic) UIButton *clickBtn;

-(void)setData:(NSMutableDictionary *)model pathRow:(NSInteger)pathRow postion:(NSInteger)positon;

@end
