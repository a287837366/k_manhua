//
//  ShopDetailMainView.h
//  ynkankan
//
//  Created by aspn300 on 16/1/10.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopDetailMainView : UIView

@property (strong, nonatomic) NSMutableDictionary *dataModel;
@property (assign, nonatomic) CGFloat viewHeight;

-(void)createViewByArray:(NSArray *)viewArray;

@end
