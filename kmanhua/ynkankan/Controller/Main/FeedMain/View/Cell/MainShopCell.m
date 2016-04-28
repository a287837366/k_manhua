//
//  MainShopCell.m
//  ynkankan
//
//  Created by aspn300 on 15/11/2.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopCell.h"

@interface MainShopCell()

@property (strong, nonatomic) UIView *conView;
@property (strong, nonatomic) UIView *lineView;

@end

@implementation MainShopCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.conView];
        [self.conView addSubview:self.leftImage];
        [self.conView addSubview:self.titleLable];
        [self.conView addSubview:self.timeLable];
        
        self.backgroundColor = [UIColor clearColor];
   
    }
    
    return self;
}


#pragma mark - get set
-(UIImageView *)leftImage{

    if (!_leftImage) {
        _leftImage = [[UIImageView alloc] init];
        _leftImage.frame = CGRectMake(10, 10, MainCell_Height - 20, MainCell_Height - 20);
//        _leftImage.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    return _leftImage;
}
-(UILabel *)titleLable{
    
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(MainCell_Height, 30, kScreenWidth - MainCell_Height - 20, MainCell_Height - 60);
        _titleLable.tintColor = [UIColor grayColor];
        _titleLable.numberOfLines = 2;
        
        _titleLable.font = [UIFont systemFontOfSize:14];
        
    }

    return _titleLable;
}

-(UILabel *)levelLable{
    
    if (!_levelLable) {
        _levelLable = [[UILabel alloc] init];
        _levelLable.frame = CGRectMake(45, 5, 20, 20);
        _levelLable.backgroundColor = Color_Main;
        _levelLable.font = [UIFont systemFontOfSize:14];
        _levelLable.textAlignment = NSTextAlignmentCenter;
        _levelLable.layer.cornerRadius = 10;
        _levelLable.layer.masksToBounds = YES;
        _levelLable.textColor = [UIColor whiteColor];
    }

    return _levelLable;
}

-(UILabel *)timeLable{

    if (!_timeLable) {
        
        _timeLable = [[UILabel alloc] init];
        _timeLable.frame = CGRectMake(kScreenWidth - 85, MainCell_Height - 22, 75, 12);
        _timeLable.font = [UIFont systemFontOfSize:11];
        _timeLable.text = @"2012-01-01";
        _timeLable.textColor = [UIColor lightGrayColor];
        _timeLable.textAlignment = NSTextAlignmentRight;
        
    }
    
    return _timeLable;
}

-(UIView *)conView{
    
    if (!_conView) {
        
        _conView = [[UIView alloc] init];
        _conView.frame = CGRectMake(0, 0, kScreenWidth - 2, MainCell_Height);
        _conView.backgroundColor = [UIColor whiteColor];
        _conView.layer.borderWidth = 0.5;
        _conView.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
        _conView.layer.cornerRadius = 4;
    }

    return _conView;
}


@end
