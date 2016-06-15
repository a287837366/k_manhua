//
//  MainShopDetailView.h
//  ynkankan
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface MainShopDetailView : UIView

/*
 *  添加内容
 */
- (void)setContentByDic:(NSMutableDictionary *)contentDic newsModel:(NewsModel *)model;

@end
