//
//  NewsMainViewCell.m
//  ynkankan
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "NewsMainViewCell.h"


@interface NewsMainViewCell()

@property (strong, nonatomic) UIView *conView;

@end

@implementation NewsMainViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.conView];
        [self.conView addSubview:self.rightImageView];
        [self.conView addSubview:self.titleLable];
        [self.conView addSubview:self.fromLable];
        [self.conView addSubview:self.timeLable];
    }
    
    
    return self;
}


-(UIView *)conView{
    
    if (!_conView) {
        
        _conView = [[UIView alloc] init];
        _conView.frame = CGRectMake(0, 2, kScreenWidth - 20, 86);
        _conView.backgroundColor = [UIColor whiteColor];
        _conView.layer.cornerRadius = 4;
        _conView.layer.masksToBounds = YES;
        
    }
    
    return _conView;
}

-(UIImageView *)rightImageView {

    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.frame = CGRectMake(5, 8, 70, 70);
        _rightImageView.layer.cornerRadius = 2;
        _rightImageView.layer.masksToBounds = YES;
        _rightImageView.contentMode = UIViewContentModeRedraw;
    }
    
    return _rightImageView;
    
}

-(UILabel *)titleLable{

    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(85, 0, kScreenWidth - 120, 60);
        _titleLable.textColor = [UIColor darkGrayColor];
        _titleLable.numberOfLines = 0;
        _titleLable.font = [UIFont systemFontOfSize:14];
    }

    return _titleLable;
}

-(UILabel *)fromLable{

    if (!_fromLable) {
        
        _fromLable = [[UILabel alloc] init];
        _fromLable.frame = CGRectMake(85, 60, kScreenWidth - 120, 26);
        _fromLable.textColor = [UIColor lightGrayColor];
        _fromLable.font = [UIFont systemFontOfSize:11];
    }
    
    return _fromLable;
}
-(UILabel *)timeLable {

    if(!_timeLable){
    
        _timeLable = [[UILabel alloc] init];
        _timeLable.frame = CGRectMake(85, 60, kScreenWidth - 120, 26);
        _timeLable.textColor = [UIColor lightGrayColor];
        _timeLable.textAlignment = NSTextAlignmentRight;
        _timeLable.font = [UIFont systemFontOfSize:11];
        
    }
    
    return _timeLable;
    
}


@end
