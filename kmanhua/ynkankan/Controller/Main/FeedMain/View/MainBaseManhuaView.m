//
//  MainBaseManhuaView.m
//  ynkankan
//
//  Created by apple on 16/2/27.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainBaseManhuaView.h"
#import "AppConstant.h"
#import "UIImageView+YmCache.h"

@interface MainBaseManhuaView()

@property (strong, nonatomic) UIImageView *manhuaIcon;
@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *timeLable;



@end

@implementation MainBaseManhuaView

-(id)init{

    if (self = [super init]) {
        
        [self addSubview:self.manhuaIcon];
        [self addSubview:self.lineView];
        [self addSubview:self.titleLable];
        [self addSubview:self.timeLable];
        [self addSubview:self.clickBtn];
        
    }
    
    return self;
}

-(void)setData:(NSMutableDictionary *)model pathRow:(NSInteger)pathRow postion:(NSInteger)positon{

    self.titleLable.text = [model objectForKey:@"m_name"];
    self.timeLable.text = [model objectForKey:@"m_createTime"];
    [self.manhuaIcon ym_setImageWithURL:[NSURL URLWithString:[model objectForKey:@"m_icon"]] placeholderImage:nil];
    self.clickBtn.tag = pathRow * 10 + positon;
    
}

-(UIImageView *)manhuaIcon{

    if (!_manhuaIcon) {
        
        _manhuaIcon = [[UIImageView alloc] init];
        _manhuaIcon.frame = CGRectMake(8, 9, 50, 50);
        _manhuaIcon.backgroundColor = Color_eeeeee;
        
        
        
    }

    return _manhuaIcon;
}

-(UIView *)lineView{

    if (!_lineView) {
        
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(7, 67, kScreenWidth - 34, 1);
        _lineView.backgroundColor = Color_eeeeee;
    }

    return _lineView;
}

-(UILabel *)titleLable{

    if(!_titleLable){
        
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(68, 24, kScreenWidth - 108, 20);
        _titleLable.font = [UIFont systemFontOfSize:14];
        _titleLable.textColor = Color_666666;
        _titleLable.text = @"시간은 나의 켵으로";
        
    }

    return _titleLable;
}

-(UILabel *)timeLable{

    if (!_timeLable) {
        
        _timeLable = [[UILabel alloc] init];
        _timeLable.frame = CGRectMake(68, 47, kScreenWidth - 102, 11);
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.textColor = Color_888888;
        _timeLable.text = @"2015-1-1";
        _timeLable.textAlignment = NSTextAlignmentRight;
        
    }
    
    return _timeLable;
}

-(UIButton *)clickBtn{

    if (!_clickBtn) {
        _clickBtn = [[UIButton alloc] init];
        _clickBtn.frame = CGRectMake(0, 0, kScreenWidth - 20, 68);
    }
    
    return _clickBtn;
}



@end
