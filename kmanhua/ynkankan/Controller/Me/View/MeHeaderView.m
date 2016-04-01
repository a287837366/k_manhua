//
//  MeHeaderView.m
//  ynkankan
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeHeaderView.h"


@interface MeHeaderView()


@end

@implementation MeHeaderView

-(id)init{

    self = [super init];
    
    if(self){
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 5, kScreenWidth - 20, MeHeaderHeight - 5);
        view.backgroundColor = [UIColor clearColor];
        
        [self addSubview:view];
        [view addSubview:self.iconButton];
    }
    


    return self;
}


#pragma mark get set 
-(UIButton *)iconButton{

    if (!_iconButton) {
        _iconButton = [[UIButton alloc] init];
        _iconButton.frame = CGRectMake((kScreenWidth - 90 - 20) / 2, (MeHeaderHeight - 95) / 2, 90, 90);
        _iconButton.backgroundColor = [UIColor whiteColor];
        _iconButton.layer.cornerRadius = 45;
    }

    return _iconButton;
}


@end
