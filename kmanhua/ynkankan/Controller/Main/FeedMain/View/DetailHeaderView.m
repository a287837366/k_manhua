//
//  DetailHeaderView.m
//  ynkankan
//
//  Created by aspn300 on 16/4/11.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "DetailHeaderView.h"
#import "AppConstant.h"
#import "ToolsClass.h"

@interface DetailHeaderView()
{


}

@property (nonatomic, strong) UIImageView * headerImageView;
@property (nonatomic, strong) UILabel *u_NameLable;
@property (nonatomic, strong) UILabel *u_TimeLable;

@property (nonatomic, strong) UIButton *favButton;
@property (nonatomic, strong) UILabel *contentLable;

@end


@implementation DetailHeaderView


-(instancetype)init
{
    
    if (self = [super init]) {
        
        [self addSubview:self.headerImageView];
        [self addSubview:self.u_NameLable];
        [self addSubview:self.u_TimeLable];
        
        [self addSubview:self.favButton];
        [self addSubview:self.contentLable];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, Detail_Height - 0.5, kScreenWidth, 0.5)];
        lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self addSubview:lineView];
    }

    return self;

}

-(CGFloat)getContentHeight:(NSString *)content{
    
    CGSize size = [ToolsClass boundingRectWithSize:content Font:[UIFont systemFontOfSize:13] size:CGSizeMake(kScreenWidth - 20, MAXFLOAT)];
    
    
    return Detail_Height + size.height + 20;
}
-(void)setContent:(NSString *)content
{
    self.contentLable.frame = CGRectMake(10, Detail_Height + 10, kScreenWidth - 20, self.frame.size.height - Detail_Height - 20 );
    self.contentLable.text = content;
}


#pragma mark - get set 
-(UIImageView *)headerImageView
{
    
    if (!_headerImageView) {
        
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.frame = CGRectMake(10, 10, Detail_Height - 20, Detail_Height - 20);
        _headerImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }

    return _headerImageView;
}

-(UILabel *)u_NameLable
{

    if (!_u_NameLable) {
        
        _u_NameLable = [[UILabel alloc] init];
        _u_NameLable.frame = CGRectMake(Detail_Height, 10, kScreenWidth - Detail_Height - 20, 14);
        _u_NameLable.font = [UIFont systemFontOfSize:13];
        _u_NameLable.textColor = [UIColor darkGrayColor];
        
        _u_NameLable.text = @"꿀꿀이";
    }
    
    return _u_NameLable;

}

-(UILabel *)u_TimeLable
{

    if (!_u_TimeLable) {
        
        _u_TimeLable = [[UILabel alloc] init];
        _u_TimeLable.frame = CGRectMake(Detail_Height, Detail_Height - 26, kScreenWidth - Detail_Height - 20, 14);
        _u_TimeLable.font = [UIFont systemFontOfSize:13];
        _u_TimeLable.textColor = [UIColor darkGrayColor];
        _u_TimeLable.text = @"2013-01-01";
        
    }
    
    return _u_TimeLable;
}

-(UIButton *)favButton
{

    if (!_favButton) {
        
        _favButton = [[UIButton alloc] init];
        _favButton.frame = CGRectMake(kScreenWidth - 80, (Detail_Height - 25) / 2, 70, 25);
        _favButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _favButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_favButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        _favButton.layer.borderColor = [[UIColor redColor] CGColor];
        _favButton.layer.borderWidth = 0.5;
        _favButton.layer.cornerRadius = 3;
        [_favButton setTitle:@"收藏" forState:UIControlStateNormal];
        
    }

    return _favButton;
}

-(UILabel *)contentLable
{
    
    if (!_contentLable) {
        
        _contentLable = [[UILabel alloc] init];
        _contentLable.textColor = [UIColor darkGrayColor];
        _contentLable.font = [UIFont systemFontOfSize:13];
        _contentLable.numberOfLines = 0;
    }

    return _contentLable;
}

@end
