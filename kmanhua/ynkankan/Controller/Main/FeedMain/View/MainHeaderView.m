//
//  MainHeaderView.m
//  ynkankan
//
//  Created by apple on 15/12/10.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainHeaderView.h"
#import "AppConstant.h"

@interface MainHeaderView()

@property (strong, nonatomic) UIImageView *mainImageView;
@property (strong, nonatomic) UIView *imageListView;

@end

@implementation MainHeaderView

-(id)init{
    
    self = [super init];
    
    if(self){
        self.viewHeight = 0;
        self.backgroundColor = Color_Background;
    }
    
    return self;
}

-(void)setDate{
    
    [self addSubview:self.mainImageView];
    [self addSubview:self.imageListView];
    
    [self createImageList];
}

#pragma mark - private
-(void)createImageList{
    
    for (int i = 0; i < 3; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(10, 5 + self.viewHeight +  i * (70 + 1), kScreenWidth - 20, 70);
        
        [view addSubview:[self createSimpleImage:[NSString stringWithFormat:@"test_%d", i + 1]]];
        [view addSubview:[self createLable:@"19"]];
        [view addSubview:[self createTitleLable:[NSString stringWithFormat:@"자하철에서 당한 썰(%d)", i]]];
        [view addSubview:[self createTimeLable:@"2015-01-01"]];
        
        [self addSubview:view];
    }
    
    self.viewHeight += 71 *3 + 5;
}

#pragma mark 图片Image
-(UIImageView *)createSimpleImage:(NSString *)imagUrl{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 10, 45, 45);
    imageView.image = [UIImage imageNamed:imagUrl];
    imageView.contentMode = UIViewContentModeRedraw;
    return imageView;
}

#pragma mark 等级Level
-(UILabel *)createLable:(NSString *)level{
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(45, 5, 20, 20);
    lable.backgroundColor = Color_Main;
    lable.font = [UIFont systemFontOfSize:14];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.layer.cornerRadius = 10;
    lable.layer.masksToBounds = YES;
    lable.textColor = [UIColor whiteColor];
    lable.text = level;
    return lable;
}

#pragma mark 文本信息
-(UILabel *)createTitleLable:(NSString *)title{

    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.frame = CGRectMake(65, 10, kScreenWidth - 95, 45);
    titleLable.tintColor = [UIColor grayColor];
    titleLable.font = [UIFont systemFontOfSize:14];
    titleLable.text = title;
    return titleLable;
}

#pragma mark 时间文本
-(UILabel *)createTimeLable:(NSString *)time{

    
    UILabel *timeLable = [[UILabel alloc] init];
    timeLable.frame = CGRectMake(10, 50, kScreenWidth - 35, 15);
    timeLable.font = [UIFont systemFontOfSize:12];
    timeLable.textColor = [UIColor lightGrayColor];
    timeLable.textAlignment = NSTextAlignmentRight;
    timeLable.text = time;
    
    return timeLable;
}

#pragma - get set
-(UIImageView *)mainImageView{

    if (!_mainImageView) {
     
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.frame = CGRectMake(0, 0, kScreenWidth, 20);
        titleLable.font = [UIFont systemFontOfSize:13];
        titleLable.textColor = Color_Main;
        titleLable.text = @"---  오늘 이야기  ---";
        titleLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLable];
        
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.frame = CGRectMake(10, 20, kScreenWidth - 20, 150);
        _mainImageView.image = [UIImage imageNamed:@"test_5"];
        _mainImageView.contentMode = UIViewContentModeRedraw;
        self.viewHeight += 170;
    }
    
    return _mainImageView;
}

-(UIView *)imageListView{

    if (!_imageListView) {
        _imageListView = [[UIView alloc] init];
    }
    
    return _imageListView;
}



@end
