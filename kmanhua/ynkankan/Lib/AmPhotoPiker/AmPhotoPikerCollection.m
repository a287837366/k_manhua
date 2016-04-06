//
//  AmPhotoPikerCollection.m
//  chooseImage
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmPhotoPikerCollection.h"

@interface AmPhotoPikerCollection()

@end

@implementation AmPhotoPikerCollection

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.backgroundColor = [UIColor clearColor];
//        self.dataSource = self;
//        self.delegate = self;
//        _selectAsstes = [NSMutableArray array];
    }
    return self;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}


@end
