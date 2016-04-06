//
//  AmPhotoAssets.m
//  chooseImage
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmPhotoAssets.h"

@implementation AmPhotoAssets

- (UIImage *)thumbImage{
    return [UIImage imageWithCGImage:[self.asset thumbnail]];
}

- (UIImage *)originImage{
    return [UIImage imageWithCGImage:[[self.asset defaultRepresentation] fullScreenImage]];
}


@end
