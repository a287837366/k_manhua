//
//  ChooseTypeCell.h
//  ynkankan
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TABLE_CELL_HEIGHT 50

@interface ChooseTypeCell : UITableViewCell

-(void)setModel:(NSIndexPath *)indexPath selection:(NSInteger)selection;

@end
