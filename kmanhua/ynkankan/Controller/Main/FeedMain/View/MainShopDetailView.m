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
#import "ToolsClass.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"

#define Item_Image_H    (kScreenWidth / 1.7f)

@interface MainShopDetailView()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *mainScollView;
@property (strong, nonatomic) UIScrollView *pictureScollView;
@property (strong, nonatomic) UILabel *countLable;
@property (strong, nonatomic) NSArray * arr;
@property (strong, nonatomic) NSMutableArray *clickImageArray;

@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *detailLable;


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

    self.mainScollView = [[UIScrollView alloc] init];
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
    
    self.clickImageArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < imageArray.count; i++) {
    
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, Item_Image_H);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i]]];
        
        UIButton *allButton = [[UIButton alloc] init];
        allButton.frame = imageView.frame;
        allButton.tag = 100 + i;
        [allButton addTarget:self action:@selector(clickDetailImage:) forControlEvents:UIControlEventTouchUpInside];
        
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString:imageArray[i]];
        [photo.srcImageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i]]];
        [self.clickImageArray addObject:photo];
        
        [self.pictureScollView addSubview:imageView];
        [self.pictureScollView addSubview:allButton];
    }
    
    self.pictureScollView.contentSize = CGSizeMake(imageArray.count * kScreenWidth, 0);
    [self.mainScollView addSubview:self.pictureScollView];
    
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
    
    [self.mainScollView addSubview:self.countLable];
}

- (void)clickDetailImage:(UIButton *)button{

    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = button.tag - 100; // 弹出相册时显示的第一张图片是？
    browser.photos = self.clickImageArray; // 设置所有的图片
    [browser show];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

//    NSLog(@">>>>> %d",  (int)(scrollView.contentOffset.x/ kScreenWidth));
    self.countLable.text = [NSString stringWithFormat:@"%d/%lu", (int)(scrollView.contentOffset.x/ kScreenWidth) + 1, (unsigned long)self.arr.count];
}

- (void)setContentByDic:(NSMutableDictionary *)contentDic newsModel:(NewsModel *)model{

    CGFloat viewY = 0.0f;
    
    if (![contentDic[@"imagelist"] isEqualToString:@""]) {

        //--------[[[查看是否有 图片存在
        self.arr = [contentDic[@"imagelist"] componentsSeparatedByString:@","];
        
        if (self.arr.count > 0) {
            [self initPictureView:self.arr];
            viewY += Item_Image_H;
        }
        //--------]]]
        
    }
    

    
    [self initTitleLable:viewY title:model.m_title];
    viewY += 50;
    
    [self initDetailLable:viewY content:contentDic[@"mcontent"]];
    viewY += self.detailLable.frame.size.height + 30;
    
    self.mainScollView.contentSize = CGSizeMake(0, viewY);
}

- (void)initTitleLable:(CGFloat)viewY title:(NSString *)title{
    
    self.titleLable = [[UILabel alloc] init];
    self.titleLable.frame = CGRectMake(10, viewY + 10, kScreenWidth - 20, 40);
    self.titleLable.textColor = Color_666666;
    self.titleLable.font = [UIFont systemFontOfSize:15];
    self.titleLable.text = title;
    self.titleLable.numberOfLines = 2;
    
    [self.mainScollView addSubview:self.titleLable];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(10, viewY + 51, kScreenWidth - 20, 1);
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.mainScollView addSubview:lineView];
}

- (void)initDetailLable:(CGFloat)viewY content:(NSString *)content {
  
    CGSize stringSize = [ToolsClass boundingRectWithSize:content Font:[UIFont systemFontOfSize:14] size:CGSizeMake(kScreenWidth - 20, MAXFLOAT)];
    
    self.detailLable = [[UILabel alloc] init];
    self.detailLable.frame = CGRectMake(10, viewY + 10, kScreenWidth - 20, stringSize.height + 20);
    self.detailLable.textColor = Color_888888;
    self.detailLable.font = [UIFont systemFontOfSize:14];
    self.detailLable.text = content;
    self.detailLable.numberOfLines = 0;
    
    [self.mainScollView addSubview:self.detailLable];
}

@end
