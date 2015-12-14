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
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
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
        view.frame = CGRectMake(0, 5 + self.viewHeight +  i * (70 + 1), kScreenWidth, 70);
        view.tag = 100 + i + 1;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
        [view addGestureRecognizer:singleTap];
        
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

#pragma mark 图片点击事件
- (void)imageClick:(UITapGestureRecognizer *)recognizer{
    [self.delegate didClickHeader:recognizer.view.tag - 100];
}

#pragma mark 点击头部
- (void)imageTitleClick{
    [self.delegate didClickHeader:0];
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
    titleLable.frame = CGRectMake(65, 10, kScreenWidth - 115, 45);
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
        titleLable.frame = CGRectMake(0, 5, kScreenWidth, 20);
        titleLable.font = [UIFont systemFontOfSize:13];
        titleLable.textColor = Color_Main;
        titleLable.text = @"---  오늘 이야기  ---";
        titleLable.textAlignment = NSTextAlignmentCenter;

        UIView *cornorView = [[UIView alloc] init];
        cornorView.frame = CGRectMake((kScreenWidth - 150) / 2, 5, 150, 20);
        cornorView.backgroundColor = [UIColor whiteColor];
        cornorView.layer.cornerRadius = 5;
        cornorView.layer.masksToBounds = YES;
        [self addSubview:cornorView];
        [self addSubview:titleLable];
        
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.frame = CGRectMake(0, 30, kScreenWidth - 20, 150);
        _mainImageView.image = [UIImage imageNamed:@"test_10"];
        _mainImageView.contentMode = UIViewContentModeRedraw;
        _mainImageView.layer.cornerRadius = 5;
        _mainImageView.layer.masksToBounds = YES;
        _mainImageView.tag = 100;
    
        UIButton *tltleButton = [[UIButton alloc] init];
        tltleButton.frame = CGRectMake(10, 20, kScreenWidth - 20, 150);
        [tltleButton addTarget:self action:@selector(imageTitleClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tltleButton];
        self.viewHeight += 180;
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
