//
//  MainShioThreeCell.h
//  ynkankan
//
//  Created by apple on 16/5/30.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"
#import "NewsModel.h"

#define MainShioThreeCellHeight  60.0f + (kScreenWidth / 3.0f) + 32.0f

@interface MainShioThreeCell : UITableViewCell


-(void)setModel:(NewsModel *)model;

@end
