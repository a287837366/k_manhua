//
//  MainHotManhuaCell.h
//  ynkankan
//
//  Created by apple on 16/2/27.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"

@protocol MainHotManhuaDelegate;

@interface MainHotManhuaCell : UITableViewCell

@property (assign, nonatomic) id<MainHotManhuaDelegate> delegate;

-(void)setManhuaModel:(NSMutableDictionary *)hotDic pathRow:(NSInteger)pathRow;

@end

@protocol MainHotManhuaDelegate <NSObject>

-(void)didClickItem:(NSInteger)pathRow position:(NSInteger)position;

@end
