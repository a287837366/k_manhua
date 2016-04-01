//
//  MeNavigationView.m
//  ynkankan
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MeNavigationView.h"
#import "AppConstant.h"

@implementation MeNavigationView

-(instancetype)init{

    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 22, kScreenWidth, 42);
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLable];
        [self addSubview:self.backButton];
    }

    return self;
}


-(UIButton *)backButton
{
    if (!_backButton) {
        
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(10, 10, 22, 22);
        [button setBackgroundImage:[UIImage imageNamed:@"nav_top_back"] forState:UIControlStateNormal];
        button.userInteractionEnabled = NO;
        
        
        [self addSubview:button];
        _backButton = [[UIButton alloc] init];
        _backButton.frame = CGRectMake(0, 0, 42, 50);
        
    }

    return _backButton;
}

-(UILabel *)titleLable {

    if (!_titleLable) {
        
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(40, 0, kScreenWidth - 80, 42);
        _titleLable.font = [UIFont boldSystemFontOfSize:15];
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }

    return _titleLable;
}
@end
