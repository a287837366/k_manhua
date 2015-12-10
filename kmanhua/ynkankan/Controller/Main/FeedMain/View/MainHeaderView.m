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
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(10, self.viewHeight + 1 + i * (50), kScreenWidth, 70);
        [self addSubview:imageView];
    }
    
}

#pragma - get set
-(UIImageView *)mainImageView{

    if (!_mainImageView) {
     
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.frame = CGRectMake(0, 0, kScreenWidth, 20);
        titleLable.font = [UIFont systemFontOfSize:13];
        titleLable.textColor = [UIColor grayColor];
        titleLable.text = @"---  오늘 이야기  ---";
        titleLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLable];
        
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.frame = CGRectMake(10, 20, kScreenWidth - 20, 100);
        _mainImageView.backgroundColor = [UIColor lightGrayColor];

        self.viewHeight += 120;
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
