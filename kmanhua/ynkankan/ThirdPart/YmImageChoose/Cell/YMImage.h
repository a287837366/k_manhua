//
//  YMImage.h
//  YMChooseImageView
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>

typedef NS_ENUM(NSInteger, YMImageType) {
    YMImageTypeWebImage = 0,                //网络图片
    YMImageTypeLocalImage ,                 //本地图片
};

typedef NS_ENUM(NSInteger, YMImageDeleteType) {
    YMImageDeleteTypeDefualtImage = 0,
    YMImageDeleteTypeDeleteImage ,
};

@interface YMImage : NSObject

-(instancetype)initWithType:(YMImageType)type;

@property (strong, nonatomic) NSString *imgUrl;
@property (strong, nonatomic) NSMutableDictionary *userInfo;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic) YMImageType type;
@property (nonatomic) YMImageDeleteType deleteType;         //defualt is --> YMImageDeleteTypeDefualtImage

@end
