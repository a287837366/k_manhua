//
//  MainShioThreeCell.m
//  ynkankan
//
//  Created by apple on 16/5/30.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShioThreeCell.h"
#import "UIImageView+WebCache.h"

@interface MainShioThreeCell()

@property (strong, nonatomic) UIView            *conView;
@property (strong, nonatomic) UIView            *centerLine;
@property (strong, nonatomic) UIView            *underLine;

@property (strong, nonatomic) UIImageView       *typeImageView;
@property (strong, nonatomic) UILabel           *titleLable;

@property (strong, nonatomic) UIImageView       *extendImag1;
@property (strong, nonatomic) UIImageView       *extendImag2;
@property (strong, nonatomic) UIImageView       *extendImag3;

@property (strong, nonatomic) UILabel           *timeLable;

@end


@implementation MainShioThreeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.conView];
        [self.conView addSubview:self.typeImageView];
        [self.conView addSubview:self.centerLine];
        [self.conView addSubview:self.underLine];
        [self.conView addSubview:self.titleLable];
        [self.conView addSubview:self.timeLable];
        
        [self.conView addSubview:self.extendImag1];
        [self.conView addSubview:self.extendImag2];
        [self.conView addSubview:self.extendImag3];
       
    }
    
    return self;
}


-(void)setModel:(NewsModel *)model{
    
    self.titleLable.text = model.m_title;
    self.timeLable.text = model.m_createTime;
    
    NSInteger type = [model.m_type intValue];
    
    
    if (type == 1) {
        [self.typeImageView setImage:[UIImage imageNamed:@"zhanpin_defualt_img"]];
        
    } else if(type == 2){
        [self.typeImageView setImage:[UIImage imageNamed:@"qiuzhi_defualt_img"]];
        
    } else if(type == 3){
        [self.typeImageView setImage:[UIImage imageNamed:@"fangcan_defualt_img"]];
        
    } else if(type == 4){
        [self.typeImageView setImage:[UIImage imageNamed:@"congwu_defualt_img"]];
        
    } else {
        [self.typeImageView setImage:[UIImage imageNamed:@"qita_defualt_img"]];
        
    }

    
    [self.extendImag1 sd_setImageWithURL:[NSURL URLWithString:model.extendArray[0]]];
    [self.extendImag2 sd_setImageWithURL:[NSURL URLWithString:model.extendArray[1]]];
    [self.extendImag3 sd_setImageWithURL:[NSURL URLWithString:model.extendArray[2]]];
}


-(UIView *)conView{
    
    if (!_conView) {
        
        _conView = [[UIView alloc] init];
        _conView.frame = CGRectMake(0, 0, kScreenWidth, MainShioThreeCellHeight);
        _conView.backgroundColor = [UIColor whiteColor];
    }
    
    return _conView;
}

-(UIView *)centerLine{

    if (!_centerLine) {
        _centerLine = [[UIView alloc] init];
        _centerLine.frame = CGRectMake(0, 60, kScreenWidth, 0.5);
        _centerLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }

    return _centerLine;
}

-(UIImageView *)typeImageView{

    if (!_typeImageView) {
        
        _typeImageView = [[UIImageView alloc] init];
        _typeImageView.frame = CGRectMake(5, 5, 50, 50);
//        _typeImageView.backgroundColor= [UIColor greenColor];
        
    }
    
    return _typeImageView;

}

-(UILabel *)titleLable{

    if (!_titleLable) {
        
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(60, 0, kScreenWidth - 70, 60);
        _titleLable.numberOfLines = 2;
        _titleLable.textColor = Color_888888;
        _titleLable.font = [UIFont systemFontOfSize:13];
        
    }

    return _titleLable;
}

-(UIImageView *)extendImag1{

    if (!_extendImag1) {
        
        _extendImag1 = [[UIImageView alloc] init];
        _extendImag1.frame = CGRectMake(4.0f, 67, (kScreenWidth - 16.0f) / 3, (kScreenWidth - 16.0f) / 3);
        _extendImag1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }
    

    return _extendImag1;
}

-(UIImageView *)extendImag2{
    
    if (!_extendImag2) {
        
        _extendImag2 = [[UIImageView alloc] init];
        _extendImag2.frame = CGRectMake(8.0f + (kScreenWidth - 16.0f) / 3, 67, (kScreenWidth - 16.0f) / 3, (kScreenWidth - 16.0f) / 3);
        _extendImag2.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }
    
    
    return _extendImag2;
}


-(UIImageView *)extendImag3{
    
    if (!_extendImag3) {
        
        _extendImag3 = [[UIImageView alloc] init];
        _extendImag3.frame = CGRectMake(12.0f + 2.0f * (kScreenWidth - 16.0f) / 3, 67, (kScreenWidth - 16.0f) / 3, (kScreenWidth - 16.0f) / 3);
        _extendImag3.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }
    
    
    return _extendImag3;
}

-(UILabel *)timeLable{

    if (!_timeLable) {
        
        _timeLable = [[UILabel alloc] init];
        _timeLable.textColor = Color_888888;
        _timeLable.font = [UIFont systemFontOfSize:12];
        _timeLable.frame = CGRectMake(0, MainShioThreeCellHeight - 28, kScreenWidth - 10, 28);
        _timeLable.textAlignment = NSTextAlignmentRight;
        
    }

    return _timeLable;
}

-(UIView *)underLine{

    if (!_underLine) {
        
        _underLine = [[UIView alloc] init];
        _underLine.backgroundColor = [UIColor lightGrayColor];
        _underLine.frame = CGRectMake(0, MainShioThreeCellHeight - 1, kScreenWidth, 0.5);
        
    }
    
    return _underLine;
}


@end
