//
//  ChooseTypeCell.m
//  ynkankan
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "ChooseTypeCell.h"
#import "AppConstant.h"
#import "UIImageView+WebCache.h"


@interface ChooseTypeCell()

@property (strong, nonatomic) UIView *conView;
@property (strong, nonatomic) UIImageView *rightImage;
@property (strong, nonatomic) UIImageView *leftImage;

@end

@implementation ChooseTypeCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.conView];
        [self.conView addSubview:self.rightImage];
        [self.conView addSubview:self.leftImage];
//        [self.conView addSubview:self.leftImage];
//        [self.conView addSubview:self.titleLable];
//        [self.conView addSubview:self.timeLable];
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}

-(void)setModel:(NSIndexPath *)indexPath selection:(NSInteger)selection{
    
    if (indexPath.row == 0) {
        [self.leftImage setImage:[UIImage imageNamed:@"zhanpin_defualt_img"]];
        
    } else if(indexPath.row == 1){
        [self.leftImage setImage:[UIImage imageNamed:@"qiuzhi_defualt_img"]];
        
    } else if(indexPath.row == 2){
        [self.leftImage setImage:[UIImage imageNamed:@"fangcan_defualt_img"]];
        
    } else if(indexPath.row == 3){
        [self.leftImage setImage:[UIImage imageNamed:@"congwu_defualt_img"]];
        
    } else {
        [self.leftImage setImage:[UIImage imageNamed:@"qita_defualt_img"]];
        
    }
    
    
    
    if (selection == indexPath.row) {
        _conView.layer.borderColor = [[UIColor redColor] CGColor];
        _conView.layer.borderWidth = 1;
        self.rightImage.hidden = NO;
    } else {
        _conView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        _conView.layer.borderWidth = 0.5;
        self.rightImage.hidden = YES;
    }
 
}

-(UIView *)conView{
    
    if (!_conView) {
        
        _conView = [[UIView alloc] init];
        _conView.frame = CGRectMake(1, 3.0f, 198, TABLE_CELL_HEIGHT - 6.0f);
        _conView.backgroundColor = [UIColor whiteColor];
        _conView.layer.borderWidth = 1;
        _conView.layer.borderColor = [[UIColor redColor] CGColor];
        _conView.layer.cornerRadius = 5;
    }
    
    return _conView;
}

-(UIImageView *)rightImage{
    
    if (!_rightImage) {
        
        _rightImage = [[UIImageView alloc] init];
        _rightImage.frame = CGRectMake(198 - 30, (TABLE_CELL_HEIGHT - 26.0f) / 2.0f , 20.0f, 20.0f);
        _rightImage.image = [UIImage imageNamed:@"icon_data_select"];
    }

    return _rightImage;
}

-(UIImageView *)leftImage{

    if (!_leftImage) {
        
        _leftImage = [[UIImageView alloc] init];
        _leftImage.frame = CGRectMake(10, 0, TABLE_CELL_HEIGHT - 6.0f, TABLE_CELL_HEIGHT - 6.0f);
        
    }
    
    return _leftImage;
}



@end
