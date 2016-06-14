//
//  MainShopDetailView.m
//  ynkankan
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopDetailView.h"
#import "AppConstant.h"
#import "UIImageView+WebCache.h"

#define Item_Image_H    (kScreenWidth / 1.7f)

@interface MainShopDetailView()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *mainScollView;
@property (strong, nonatomic) UIScrollView *pictureScollView;
@property (strong, nonatomic) UILabel *countLable;
@property (strong, nonatomic) NSArray * arr;


@end

@implementation MainShopDetailView

- (instancetype)init {

    if (self = [super init]) {

        [self addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
        self.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 114);
        self.backgroundColor = [UIColor whiteColor];
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
    self.pictureScollView.frame = CGRectMake(0, 0, kScreenWidth, Item_Image_H);
    self.pictureScollView.pagingEnabled = YES;
    self.pictureScollView.backgroundColor = Color_Background;
    self.pictureScollView.showsHorizontalScrollIndicator = NO;
    self.pictureScollView.showsVerticalScrollIndicator = NO;
    self.pictureScollView.delegate = self;
    
    for (int i = 0; i < imageArray.count; i++) {
    
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, Item_Image_H);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i]]];
        
        [self.pictureScollView addSubview:imageView];
    }
    
    self.pictureScollView.contentSize = CGSizeMake(imageArray.count * kScreenWidth, 0);
    [self addSubview:self.pictureScollView];
    
    self.countLable = [[UILabel alloc] init];
    self.countLable.frame = CGRectMake(kScreenWidth - 45, Item_Image_H - 30, 35, 20);
    self.countLable.backgroundColor = [UIColor blackColor];
    self.countLable.layer.cornerRadius = 4.0f;
    self.countLable.textAlignment = NSTextAlignmentCenter;
    self.countLable.font = [UIFont systemFontOfSize:12];
    self.countLable.textColor = [UIColor whiteColor];
    self.countLable.layer.masksToBounds = YES;
    self.countLable.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)self.arr.count];
    self.countLable.alpha = 0.5;
    
    [self addSubview:self.countLable];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSLog(@">>>>> %d",  (int)(scrollView.contentOffset.x/ kScreenWidth));
    self.countLable.text = [NSString stringWithFormat:@"%d/%lu", (int)(scrollView.contentOffset.x/ kScreenWidth) + 1, (unsigned long)self.arr.count];
}

- (void)setContentByDic:(NSMutableDictionary *)contentDic{

    CGFloat viewY = 0.0f;
    
    //--------[[[查看是否有 图片存在
    self.arr = [contentDic[@"imagelist"] componentsSeparatedByString:@","];
    
    if (self.arr.count > 0) {
        [self initPictureView:self.arr];
        viewY += Item_Image_H;
    }
    //--------]]]
    
    
    
}

@end
