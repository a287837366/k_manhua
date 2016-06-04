//
//  EmptyView.m
//  ynkankan
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "EmptyView.h"
#import "AppConstant.h"

@interface EmptyView()

@property (strong, nonatomic) UILabel *emptyLable;
@property (strong, nonatomic) UIButton *emptyButton;

@end

@implementation EmptyView

-(instancetype)init{

    self = [super init];
    
    if (self) {
        
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self addSubview:self.emptyLable];
        [self addSubview:self.emptyButton];
        
        return self;
    }
    
    return self;
}

-(void)setEmptyMsg:(NSString *)msg{
    
    [self.emptyLable setText:msg];
}

-(void)didClickBtn:(UIButton *)button{

    if (self.delegate == nil) {
        
        return;
    }
    
    [self.delegate didClickEmpty];
    
}

-(UIButton *)emptyButton{

    if(!_emptyButton){
    
        _emptyButton = [[UIButton alloc] init];
        _emptyButton.frame = CGRectMake((kScreenWidth - 100.0f) / 2, (kScreenHeight / 2.0f) - 23.0f, 100.0f, 25.0f);
        _emptyButton.backgroundColor = Color_ButtonColor;
        _emptyButton.layer.cornerRadius = 4.0f;
        _emptyButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_emptyButton addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_emptyButton setTitle:@"登入" forState:UIControlStateNormal];
    }

    return _emptyButton;
}

-(UILabel *)emptyLable{
    
    if (!_emptyLable) {
        
        _emptyLable = [[UILabel alloc] init];
        _emptyLable.frame = CGRectMake(0, (kScreenHeight / 2.0f) - 55.0f, kScreenWidth, 16);
        _emptyLable.font = [UIFont systemFontOfSize:14];
        _emptyLable.textAlignment = NSTextAlignmentCenter;
        [_emptyLable setTextColor:Color_888888];
        _emptyLable.text = @"发布需要登入";
    }
    
    
    return _emptyLable;
}


@end

