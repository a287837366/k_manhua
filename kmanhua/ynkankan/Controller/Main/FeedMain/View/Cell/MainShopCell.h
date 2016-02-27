//
//  MainShopCell.h
//  ynkankan
//
//  Created by aspn300 on 15/11/2.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"

@interface MainShopCell : UITableViewCell

@property (strong, nonatomic) UIImageView *leftImage;
@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *levelLable;
@property (strong, nonatomic) UILabel *timeLable;

-(void)setData:(NSMutableDictionary *)modle;

@end
