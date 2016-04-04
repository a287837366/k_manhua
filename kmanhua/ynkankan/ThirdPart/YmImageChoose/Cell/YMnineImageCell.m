//
//  YMnineImageCell.m
//  YMChooseImageView
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "YMnineImageCell.h"



@implementation YMnineImageCell

@synthesize imageView;

+(instancetype)initCell:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath withimage:(YMImage *)image{

    static NSString *identifierItem = kYMnineImageCell;
    
    YMnineImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierItem forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifierItem owner:self options:nil] lastObject];
    }

    
    if (image == nil) {
        cell.imageView.image = [UIImage imageNamed:@"add"];
        cell.delete_icon.hidden = YES;
        cell.deleteButton.userInteractionEnabled = NO;
    
    } else {
        
        cell.delete_icon.hidden = NO;
        cell.deleteButton.userInteractionEnabled = YES;
        
        if (image.type == YMImageTypeLocalImage) {
            cell.imageView.image = image.image;
        } else {
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image.imgUrl]];
        }
        
        
    }

   
    
    return cell;

}

@end
