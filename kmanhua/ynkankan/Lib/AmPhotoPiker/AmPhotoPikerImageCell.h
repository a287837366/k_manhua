//
//  AmPhotoPikerImageCell.h
//  chooseImage
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AmPhotoPikerImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *selectImg;

+ (instancetype)initCell:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath;

@end
