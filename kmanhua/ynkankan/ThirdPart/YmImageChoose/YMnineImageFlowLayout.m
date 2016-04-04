//
//  YMnineImageFlowLayout.m
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "YMnineImageFlowLayout.h"

@implementation YMnineImageFlowLayout

+(id)initFlowLayout:(NSInteger)itemCount{

    NSInteger imageSize = ([UIScreen mainScreen].bounds.size.width - 60) / (itemCount) - 8;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置item的大小
    flowLayout.itemSize = CGSizeMake(imageSize , imageSize);
    
    return flowLayout;

}

@end
