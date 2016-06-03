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
        view.frame = CGRectMake(0, 10, kScreenWidth, MeHeaderHeight - 10);
        view.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:view];
        [view addSubview:self.iconButton];
        [view addSubview:self.userId];
        [view addSubview:self.nikeName];
    }
    


    return self;
}


#pragma mark get set 
-(UIButton *)iconButton{

    if (!_iconButton) {
        _iconButton = [[UIButton alloc] init];
        _iconButton.frame = CGRectMake(10, (MeHeaderHeight - 90) / 2, 80, 80);
        [_iconButton setBackgroundImage:[UIImage imageNamed:@"nav_top_background"] forState:UIControlStateNormal];
        _iconButton.layer.cornerRadius = 40;
        _iconButton.layer.masksToBounds = YES;
    }

    return _iconButton;
}

-(UILabel *)userId{

    if(!_userId){
    
        _userId = [[UILabel alloc] init];
        _userId.frame = CGRectMake(100, 35, kScreenWidth - 120, 15);
        _userId.font = [UIFont systemFontOfSize:15];
        _userId.textColor = Color_888888;
        
    }

    return _userId;
}

-(UILabel *)nikeName{

    if (!_nikeName) {
        
        _nikeName = [[UILabel alloc] init];
        _nikeName.frame = CGRectMake(100, 65, kScreenWidth - 120, 15);
        _nikeName.font = [UIFont systemFontOfSize:15];
        _nikeName.textColor = Color_888888;
        
        return _nikeName;
    }

    return _nikeName;
}


@end
