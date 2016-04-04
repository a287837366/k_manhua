//
//  YMnineImageView.h
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMImage.h"

#define Screen_Width  [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height

@protocol YMnineIamgeViewDelegate;

@interface YMnineImageView : UIView

//添加网络图片
-(void)addWebImageWithUrl:(NSString *)url userInfo:(NSMutableDictionary *)userInfo;
//添加本地图片
-(void)addLocalImageWithUIimage:(UIImage *)image;


-(void)reloadYMnineView;    //刷新页面  如果高度改变会调用 deltegate - heightIsChange:(CGFloat)

// [YMImageTypeWebImage]    获取网络图片
// [YMImageTypeLocalImage]  获取本地图片
-(NSMutableArray *)getImageListByImageType:(YMImageType)imageType;


@property (nonatomic) BOOL isshowDeleteAlert;// 删除的时候需要弹出框

@property (nonatomic) CGFloat itemHeight;

@property (nonatomic, weak) id<YMnineIamgeViewDelegate> delegate;

@end


@protocol YMnineIamgeViewDelegate <NSObject>

@optional
-(void)didClickAddButton;   //点击添加图片按钮
-(void)heightIsChange:(CGFloat)height;  //改变高度



@end


