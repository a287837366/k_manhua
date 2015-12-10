//
//  MainShopCell.m
//  ynkankan
//
//  Created by aspn300 on 15/11/2.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopCell.h"

@interface MainShopCell()

@property (strong, nonatomic) UIImageView *leftImage;
@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *levelLable;
@property (strong, nonatomic) UILabel *timeLable;

@end

@implementation MainShopCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.leftImage];
        [self.contentView addSubview:self.titleLable];
        [self.contentView addSubview:self.levelLable];
        [self.contentView addSubview:self.timeLable];

    }
    
    self.titleLable.text = @"지하철 지하철 지하철";
    self.levelLable.text = @"19";
    self.timeLable.text = @"2015-08-01";
    
    return self;
}


#pragma mark - get set
-(UIImageView *)leftImage{

    if (!_leftImage) {
        _leftImage = [[UIImageView alloc] init];
        _leftImage.frame = CGRectMake(10, 10, 45, 45);
        _leftImage.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _leftImage;
}
-(UILabel *)titleLable{
    
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.frame = CGRectMake(65, 10, kScreenWidth - 95, 45);
        _titleLable.tintColor = [UIColor grayColor];
        _titleLable.font = [UIFont systemFontOfSize:14];
        
    }

    return _titleLable;
}

-(UILabel *)levelLable{

    if (!_levelLable) {
        
        _levelLable = [[UILabel alloc] init];
        _levelLable.frame = CGRectMake( 45, 5, 20, 20);
        _levelLable.backgroundColor = [UIColor redColor];
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
        _timeLable.frame = CGRectMake(10, 50, kScreenWidth - 15, 15);
        _timeLable.font = [UIFont systemFontOfSize:12];
        _timeLable.textColor = [UIColor lightGrayColor];
        _timeLable.textAlignment = NSTextAlignmentRight;
        
    }
    
    return _timeLable;
}

@end
