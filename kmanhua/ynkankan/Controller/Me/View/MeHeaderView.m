//
//  MeHeaderView.m
//  ynkankan
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeHeaderView.h"

@implementation MeHeaderView

-(id)init{

    self = [super init];
    
    if (!self) {
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 0, kScreenWidth - 20, MeHeaderHeight);
        view.layer.borderColor = [[UIColor colorWithRed:252/255.0f green:21/255.0f blue:115/255.0f alpha:1] CGColor];
        view.layer.borderWidth = 2;
        
        [self addSubview:view];
        
    }

    return self;
}

@end
