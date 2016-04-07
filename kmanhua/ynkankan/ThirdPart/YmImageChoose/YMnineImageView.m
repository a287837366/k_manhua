//
//  YMnineImageView.m
//  YMChooseImageView
//
//  Created by apple on 15/10/24.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "YMnineImageView.h"
#import "YMnineImageFlowLayout.h"
#import "YMnineImageCell.h"



@interface YMnineImageView()<UICollectionViewDelegate, UICollectionViewDataSource , UIAlertViewDelegate>{
    
    NSInteger clickIndex;
    NSInteger currentCount;
    
}

//九宫图
@property (strong, nonatomic) UICollectionView *collectionView;

//图片数组
@property (strong, nonatomic) NSMutableArray *imageArray;

@property (strong, nonatomic) NSMutableArray *localImgArray;

@property (strong, nonatomic) NSMutableArray *webImageArray;

@end

@implementation YMnineImageView

@synthesize delegate;

-(id)init{

    self = [super init];
    
    if (self) {
        self.isshowDeleteAlert = YES;
        self.itemHeight = ([UIScreen mainScreen].bounds.size.width - 60) / 3;
        
        [self addSubview:self.collectionView];
    }
    
    return self;
}



#pragma mark - public
-(void)reloadYMnineView{
    
    if (self.imageArray.count == 9) {
        [delegate heightIsChange:(self.imageArray.count / 3) * self.itemHeight];
    } else {
        [delegate heightIsChange:(self.imageArray.count / 3 + 1) * self.itemHeight];
    }
    
    CGRect rect = self.frame;
    rect.size.height = (self.imageArray.count / 3 + 1) * self.itemHeight;
    self.frame = rect;
    
    CGRect rectCollection = self.collectionView.frame;
    rectCollection.size.height = (self.imageArray.count / 3 + 1) * self.itemHeight;
    self.collectionView.frame = rectCollection;
    
    currentCount = self.imageArray.count;
    [self.collectionView reloadData];
}

-(void)addWebImageWithUrl:(NSString *)url userInfo:(NSMutableDictionary *)userInfo{

    if (self.imageArray.count == 9) return;

    YMImage *image = [[YMImage alloc] initWithType:YMImageTypeWebImage];
    image.imgUrl = url;
    image.userInfo = userInfo;

    [self.webImageArray addObject:image];
    [self.imageArray addObject:image];
}

-(void)addLocalImageWithUIimage:(UIImage *)image{

    if (self.imageArray.count == 9) return;
  
    YMImage *ymImage = [[YMImage alloc] initWithType:YMImageTypeLocalImage];
    ymImage.image = image;
    
    [self.localImgArray addObject:ymImage];
    [self.imageArray addObject:ymImage];
}

-(NSMutableArray *)getImageListByImageType:(YMImageType)imageType{
    
    
    if (imageType == YMImageTypeLocalImage) {
        NSLog(@"YMImageTypeLocalImage %@ ", self.localImgArray);
        return self.localImgArray;
   
    } else if (imageType == YMImageTypeWebImage) {
        NSLog(@"YMImageTypeWebImage  %@ ", self.webImageArray);
        return self.webImageArray;
    } else {
    
        return nil;
    }

}



#pragma mark - collocetionDelete
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if ([self.imageArray count] == 9) return 9;
    
    return [self.imageArray count] + 1;
}

//init cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YMnineImageCell *cell;
    if (indexPath.row == self.imageArray.count) {
        cell  = [YMnineImageCell initCell:collectionView withIndexPath:indexPath withimage:nil];
    } else {
        cell  = [YMnineImageCell initCell:collectionView withIndexPath:indexPath withimage:[self.imageArray objectAtIndex:indexPath.row]];
    }
    
    cell.deleteButton.tag = 100 + indexPath.row;
    
    [cell.deleteButton addTarget:self action:@selector(clickDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == self.imageArray.count) [delegate didClickAddButton];
}

#pragma mark - Action
-(void)clickDelete:(UIButton *)button{
    
    if (self.isshowDeleteAlert) {
        clickIndex = button.tag - 100;
        [self showDeleteAlert];
        return;
    }
    
    [self deleteImageView:button.tag - 100];
    [self reloadYMnineView];
}
-(void)deleteImageView:(NSInteger)tag{
    
    YMImage *currentImage = [self.imageArray objectAtIndex:tag];
    /* 如果是网路图片更改标记，如果是本地图片从数组中删除     
     */
    if (currentImage.type == YMImageTypeWebImage) {
        currentImage.deleteType = YMImageDeleteTypeDeleteImage;
    } else {
        [self.localImgArray removeObject:currentImage];
    }
    
    [self.imageArray removeObjectAtIndex:tag];
}

#pragma mark 弹出Alert
-(void)showDeleteAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"确定删除图片吗"
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定",nil];
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) return;
    [self deleteImageView:clickIndex];
    [self reloadYMnineView];
}

#pragma mark - get set
-(UICollectionView *)collectionView{

    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width - 60, self.itemHeight) collectionViewLayout:[YMnineImageFlowLayout initFlowLayout:3]];
       
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        UINib *cellNib = [UINib nibWithNibName:kYMnineImageCell bundle: [NSBundle mainBundle]];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:kYMnineImageCell];

    }
    
    return _collectionView;
}

-(NSMutableArray *)localImgArray{

    if (!_localImgArray) {
        _localImgArray = [[NSMutableArray alloc] init];
    }
    
    return _localImgArray;
}

-(NSMutableArray *)webImageArray{

    if (!_webImageArray) {
        _webImageArray = [[NSMutableArray alloc] init];
        
    }
    return _webImageArray;
}

-(NSMutableArray *)imageArray{

    if (!_imageArray) {
        
        _imageArray = [[NSMutableArray alloc] init];
    }
    
    return _imageArray;
}


@end
