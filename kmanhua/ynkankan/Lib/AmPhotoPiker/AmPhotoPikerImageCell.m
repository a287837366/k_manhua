//
//  AmPhotoPikerImageCell.m
//  chooseImage
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmPhotoPikerImageCell.h"

#define kAmPhotoPikerImageCell @"AmPhotoPikerImageCell"

@implementation AmPhotoPikerImageCell

+ (instancetype)initCell:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifierItem = kAmPhotoPikerImageCell;
    
    AmPhotoPikerImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierItem forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifierItem owner:self options:nil] lastObject];
    }
    
    return cell;
    
}

@end
