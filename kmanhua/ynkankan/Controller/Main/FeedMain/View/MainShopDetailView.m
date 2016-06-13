//
//  MainShopDetailView.m
//  ynkankan
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopDetailView.h"
#import "AppConstant.h"

#define Item_Image_H    (kScreenWidth / 1.7f)

@interface MainShopDetailView()

@property (strong, nonatomic) UIScrollView *mainScollView;
@property (strong, nonatomic) UIScrollView *pictureScollView;


@end

@implementation MainShopDetailView

- (instancetype)init {

    if (self = [super init]) {
        self.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 114);
        [self initScollView];
    }

    return self;
}

- (void)initScollView {

    self.mainScollView.frame = self.bounds;
    [self addSubview:self.mainScollView];
}

- (void)initPictureView:(NSArray *)imageArray{
  
    self.pictureScollView = [[UIScrollView alloc] init];
    self.pictureScollView.backgroundColor = [UIColor redColor];
    self.pictureScollView.frame = CGRectMake(0, 0, kScreenWidth, Item_Image_H);
    
    [self addSubview:self.pictureScollView];
}

- (void)setContentByDic:(NSMutableDictionary *)contentDic{

    CGFloat viewY = 0.0f;
    
    //--------[[[查看是否有 图片存在
    NSArray * arr = [contentDic[@"imagelist"] componentsSeparatedByString:@","];
    
    if (arr.count > 0) {
        [self initPictureView:arr];
        viewY += Item_Image_H;
    }
    //--------]]]
    
    
    
}

@end
