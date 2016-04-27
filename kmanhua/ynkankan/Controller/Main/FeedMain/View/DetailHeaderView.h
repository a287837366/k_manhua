//
//  DetailHeaderView.h
//  ynkankan
//
//  Created by aspn300 on 16/4/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>


#define Detail_Height   60


@interface DetailHeaderView : UIView

@property (nonatomic, strong) UIButton *favButton;
@property (nonatomic, strong) UILabel *u_NameLable;
@property (nonatomic, strong) UILabel *u_TimeLable;

-(CGFloat)getContentHeight:(NSMutableDictionary *)detailDic;
-(void)setContent:(NSMutableDictionary *)detailDic;

-(void)favButtonByUid:(NSString *)uid;

@end
