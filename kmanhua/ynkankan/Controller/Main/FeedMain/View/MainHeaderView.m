//
//  MainHeaderView.m
//  ynkankan
//
//  Created by apple on 15/12/10.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainHeaderView.h"
#import "AppConstant.h"
#import "UIImageView+YmCache.h"

@interface MainHeaderView()

@property (strong, nonatomic) UIImageView *mainImageView;
@property (strong, nonatomic) UILabel *mainLable;
@property (strong, nonatomic) UIView *imageListView;

@end

@implementation MainHeaderView

-(id)init{
    
    self = [super init];
    
    if(self){
        self.viewHeight = 0;
        self.backgroundColor = Color_Background;
        self.layer.cornerRadius = 5;
    }
    
    return self;
}

-(void)setDate:(NSMutableArray *)newDataArray{
    
    [self addSubview:self.mainImageView];
    [self addSubview:self.mainLable];
  
    
    self.mainLable.text = [[newDataArray objectAtIndex:0] objectForKey:@"m_name"];
    [self.mainImageView ym_setImageWithURL:[[newDataArray objectAtIndex:0] objectForKey:@"m_icon"] placeholderImage:nil];
    
    
    [self addSubview:self.imageListView];
    [self createImageList:newDataArray];
}

#pragma mark - private
-(void)createImageList:(NSMutableArray *)newDataArray{
    
    for (int i = 0; i < newDataArray.count - 1; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(0, 5 + self.viewHeight +  i * (70 + 1), kScreenWidth, 70);
        view.tag = 100 + i + 1;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)];
        [view addGestureRecognizer:singleTap];
        [view addSubview:[self createSimpleImage:[[newDataArray objectAtIndex:(i + 1)] objectForKey:@"m_icon"]]];
        [view addSubview:[self createTitleLable:[[newDataArray objectAtIndex:(i + 1)] objectForKey:@"m_name"]]];
        [view addSubview:[self createTimeLable:[[newDataArray objectAtIndex:(i + 1)] objectForKey:@"m_createTime"]]];
        
        [self addSubview:view];
        
        self.viewHeight += 71;
    }
    
    self.viewHeight += 5;
}

#pragma mark 图片Image
-(UIImageView *)createSimpleImage:(NSString *)imagUrl{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 10, 45, 45);
    [imageView ym_setImageWithURL:[NSURL URLWithString:imagUrl] placeholderImage:nil];
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
        titleLable.text = @"---  최신 이야기  ---";
        titleLable.textAlignment = NSTextAlignmentCenter;

        UIView *cornorView = [[UIView alloc] init];
        cornorView.frame = CGRectMake((kScreenWidth - 150) / 2, 5, 150, 20);
        cornorView.backgroundColor = [UIColor whiteColor];
        cornorView.layer.cornerRadius = 5;
        [self addSubview:cornorView];
        [self addSubview:titleLable];
        
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.frame = CGRectMake(0, 30, kScreenWidth - 20, 150);
        _mainImageView.image = [UIImage imageNamed:@"test_10"];
        _mainImageView.contentMode = UIViewContentModeRedraw;
        _mainImageView.layer.cornerRadius = 5;
        _mainImageView.tag = 100;

        
        UIButton *tltleButton = [[UIButton alloc] init];
        tltleButton.frame = CGRectMake(10, 20, kScreenWidth - 20, 150);
        [tltleButton addTarget:self action:@selector(imageTitleClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tltleButton];
        self.viewHeight += 180;
    }
    
    return _mainImageView;
}

-(UILabel *)mainLable{

    if (!_mainLable) {
        
        _mainLable = [[UILabel alloc] init];
        _mainLable.backgroundColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:0.5f];
        _mainLable.font = [UIFont systemFontOfSize:17];
        _mainLable.textAlignment = NSTextAlignmentCenter;
        _mainLable.textColor = [UIColor whiteColor];
        _mainLable.frame = CGRectMake(0, 150, kScreenWidth - 20, 30);
        _mainImageView.frame = CGRectMake(0, 30, kScreenWidth - 20, 150);
        
    }

    return _mainLable;
}

-(UIView *)imageListView{

    if (!_imageListView) {
        _imageListView = [[UIView alloc] init];
    }
    
    return _imageListView;
}



@end
