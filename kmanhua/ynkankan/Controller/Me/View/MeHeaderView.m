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
        view.backgroundColor = Color_fcfcfc;
        view.layer.cornerRadius = 5;
        
        [self addSubview:view];
        [view addSubview:self.iconButton];
        [view addSubview:self.nikeName];
        [view addSubview:self.contentLable];
    }
    


    return self;
}


#pragma mark get set 
-(UIButton *)iconButton{

    if (!_iconButton) {
        _iconButton = [[UIButton alloc] init];
        _iconButton.frame = CGRectMake(15, (MeHeaderHeight - 55) / 2 - 10, 50, 50);
        _iconButton.backgroundColor = Color_Main;
        _iconButton.layer.cornerRadius = 25;
        _iconButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }

    return _iconButton;
}

-(UILabel *)nikeName{

    if (!_nikeName) {
     
        _nikeName = [[UILabel alloc] init];
        _nikeName.frame = CGRectMake(75, (MeHeaderHeight - 55) / 2 + 1, kScreenWidth - 88, 14);
        _nikeName.font = [UIFont systemFontOfSize:15];
        _nikeName.tintColor = Color_666666;
        _nikeName.text = @"닉넴: 쨈쨈1호";
    }

    return _nikeName;
}

-(UILabel *)contentLable{

    if (!_contentLable) {
        
        _contentLable = [[UILabel alloc] init];
        _contentLable.frame = CGRectMake(15, MeHeaderHeight - 34, kScreenWidth - 45, 20);
        _contentLable.backgroundColor = Color_f5f5f2;
        _contentLable.layer.cornerRadius = 2;
        _contentLable.text = @" 쨈쨈에 오신것을 환영합니다.";
        _contentLable.font = [UIFont systemFontOfSize:11];
        _contentLable.tintColor = Color_888888;
        
    }

    return _contentLable;
}


@end
