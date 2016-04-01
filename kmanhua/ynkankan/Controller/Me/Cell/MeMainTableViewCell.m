//
//  MeMainTableViewCell.m
//  ynkankan
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeMainTableViewCell.h"


@interface MeMainTableViewCell()

@property (strong, nonatomic) UIView *conView;
@property (strong, nonatomic) UIImageView *rightImage;


@end

@implementation MeMainTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   
    if (self){
      
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];

        [self.contentView addSubview:self.conView];
        [self.conView addSubview:self.titleLable];
        [self.conView addSubview:self.rightImage];
        
    }
    

    return self;
}

-(UIView *)conView{
    
    if (!_conView) {
        
        _conView = [[UIView alloc] init];
        _conView.frame = CGRectMake(0, 2, kScreenWidth - 20, 46);
        _conView.backgroundColor = [UIColor clearColor];
        _conView.layer.borderColor = [[UIColor whiteColor] CGColor];
        _conView.layer.borderWidth = 1;
        _conView.layer.cornerRadius = 6;
        
    }
    
    return _conView;
}

-(UIImageView *)rightImage{

    if (!_rightImage) {
        _rightImage = [[UIImageView alloc] init];
        _rightImage.frame = CGRectMake(kScreenWidth - 47, 15, 15, 15);
        _rightImage.image = [UIImage imageNamed:@"me_right_arraw"];
        _rightImage.alpha = 0.4;
    }

    return _rightImage;
}

-(UILabel *)titleLable{

    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(15, 9, kScreenWidth - 70, 26);
        _titleLable.font = [UIFont systemFontOfSize:14];
        _titleLable.textColor = [UIColor whiteColor];
    }
    
    return _titleLable;
}

@end
