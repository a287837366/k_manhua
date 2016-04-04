//
//  YMnineImageCell.h
//  YMChooseImageView
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

#define kYMnineImageCell @"YMnineImageCell"
#import "YMImage.h"

@interface YMnineImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *delete_icon;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

+(instancetype)initCell:(UICollectionView *)initCell withIndexPath:(NSIndexPath *)indexPath withimage:(YMImage *)image;

@end
