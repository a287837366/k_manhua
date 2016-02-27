//
//  MainHotManhuaCell.m
//  ynkankan
//
//  Created by apple on 16/2/27.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainHotManhuaCell.h"
#import "MainBaseManhuaView.h"


@interface MainHotManhuaCell()

@property (strong, nonatomic) UIView *conView;
@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UILabel *typeName;

@property (strong, nonatomic) UIView *topLine;

@property (strong, nonatomic) MainBaseManhuaView *ItemView1;
@property (strong, nonatomic) MainBaseManhuaView *ItemView2;
@property (strong, nonatomic) MainBaseManhuaView *ItemView3;

@end

@implementation MainHotManhuaCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.conView];
        [self.conView addSubview:self.topLine];
        [self.conView addSubview:self.ItemView1];
        [self.conView addSubview:self.ItemView2];
        [self.conView addSubview:self.ItemView3];
        [self setTypeView];

        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

-(void)setManhuaModel:(NSMutableDictionary *)hotDic{
    
    self.typeName.text = [hotDic objectForKey:@"type_name"];
    [self.ItemView1 setData:[[hotDic objectForKey:@"manhuas"] objectAtIndex:0]];
    [self.ItemView2 setData:[[hotDic objectForKey:@"manhuas"] objectAtIndex:1]];
    [self.ItemView3 setData:[[hotDic objectForKey:@"manhuas"] objectAtIndex:2]];
    
}

-(void)setTypeView{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth - 20, 30);
    
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, 5, 3, 20);
    lineView.backgroundColor = Color_Main;
    [view addSubview:lineView];
    
    [view addSubview:self.typeName];
    
    [self.conView addSubview:view];
}

-(UIView *)conView{

    if (!_conView) {
        
        _conView = [[UIView alloc] init];
        _conView.frame = CGRectMake(0, 0, kScreenWidth - 20, 234);
        _conView.backgroundColor = [UIColor whiteColor];
        
    }
    
    return _conView;
}

-(UILabel *)typeName{
    
    if (!_typeName) {
        
        _typeName = [[UILabel alloc] init];
        _typeName.frame = CGRectMake(10, 0, kScreenWidth - 36, 30);
        _typeName.textColor = Color_666666;
        _typeName.font = [UIFont systemFontOfSize:13];
        _typeName.text = @"공포";
        
    }
    
    return _typeName;
}

-(UIView *)topLine{

    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.frame = CGRectMake(7, 31, kScreenWidth - 34, 1);
        _topLine.backgroundColor = Color_eeeeee;
        
    }
    
    return _topLine;
}

-(MainBaseManhuaView *)ItemView1{
    
    if (!_ItemView1) {
        
        _ItemView1 = [[MainBaseManhuaView alloc] init];
        _ItemView1.frame = CGRectMake(0, 32, kScreenWidth - 20, 68);
        
    }
    
    return _ItemView1;
}

-(MainBaseManhuaView *)ItemView2{

    if (!_ItemView2) {
        
        _ItemView2 = [[MainBaseManhuaView alloc] init];
        _ItemView2.frame = CGRectMake(0, 98, kScreenWidth - 20, 68);
        
    }
    
    return _ItemView2;
}

-(MainBaseManhuaView *)ItemView3{
    
    if (!_ItemView3) {
        
        _ItemView3 = [[MainBaseManhuaView alloc] init];
        _ItemView3.frame = CGRectMake(0, 166, kScreenWidth - 20, 68);
        _ItemView3.lineView.hidden = YES;
        
    }
    
    return _ItemView3;
}


@end
