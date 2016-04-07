//
//  AmPhotoPickerAssetsViewController.m
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmPhotoPickerAssetsViewController.h"
#import "AmToolBarView.h"
#import "AmPhotoHeader.h"
#import "AmPhotoPikerTools.h"
#import "AmPhotoAssets.h"
#import "AmPhotoPikerImageCell.h"
#import "AmPhotoHeader.h"


@interface AmPhotoPickerAssetsViewController ()<AmToolBarViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) AmToolBarView *toolBar;
@property (strong, nonatomic) NSArray *assetsArray;

@property (strong, nonatomic) NSMutableArray *selectArray;

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation AmPhotoPickerAssetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initData];
    [self initView];
    
    [self getAssetsList];
}

-(void)initData{
    
    self.selectArray = [[NSMutableArray alloc] init];
    
}

-(void)initView{
    self.view.backgroundColor = Background_Color;
    
    [self setCancleButton];
    [self.view addSubview:self.toolBar];
    
    [self.view addSubview:self.collectionView];
}

-(void)setCancleButton{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil) style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void)clickRightButton{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)getAssetsList{
    AmPhotoPikerTools *tools = [[AmPhotoPikerTools alloc] init];
   
    __block NSMutableArray *assetsM = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;

    [tools getGroupPhotosWithGroup:self.groupModel finished:^(NSArray *assets){
        
        [assets enumerateObjectsUsingBlock:^(ALAsset *asset, NSUInteger idx, BOOL *stop) {
            
            AmPhotoAssets *amAssets = [[AmPhotoAssets alloc] init];
            amAssets.asset = asset;
            [assetsM addObject:amAssets];
            
        }];
        
        weakSelf.assetsArray = assetsM;
        [weakSelf.collectionView reloadData];
    }];
}

#pragma mark - AboutCollection
-(UICollectionViewFlowLayout *)getFolowLayout{

    UICollectionViewFlowLayout *itemOverSeaLayout= [[UICollectionViewFlowLayout alloc] init];
    
    itemOverSeaLayout.itemSize = CGSizeMake((Screen_Width - 50.0f) * 0.25f , (Screen_Width - 50.0f) * 0.25f);
    return itemOverSeaLayout;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    if (self.assetsArray == nil) {
        return 0;
    }
    
    return [self.assetsArray count];
}

#pragma mark  自定义Collection Cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AmPhotoPikerImageCell *amItemCell = [AmPhotoPikerImageCell initCell:collectionView withIndexPath:indexPath];
   
    AmPhotoAssets *amAssets = [self.assetsArray objectAtIndex:indexPath.row];
    
    [amItemCell.mainImage setImage:amAssets.thumbImage];
    NSInteger index = [self.selectArray indexOfObject:[self.assetsArray objectAtIndex:indexPath.row]];

    if(index < self.selectArray.count){
        amItemCell.selectImg.image = [UIImage imageNamed:Image_SelectionSeleted];
    } else {
        amItemCell.selectImg.image = [UIImage imageNamed:Image_SelectionDefualt];
    }
    
    
    
    
    return amItemCell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    

    
    NSInteger index = [self.selectArray indexOfObject:[self.assetsArray objectAtIndex:indexPath.row]];

    if(index < self.selectArray.count){
        
        [self.selectArray removeObject:[self.assetsArray objectAtIndex:indexPath.row]];
    
    } else {
      
        if (self.selectArray.count >= self.maxCount) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不能超过9张" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            
            [alertView show];
            return;
        }
        
        [self.selectArray addObject:[self.assetsArray objectAtIndex:indexPath.row]];
    }
    
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    [self.toolBar setCount:self.selectArray.count];
}


#pragma mark - AmToolBarViewDelegate
-(void)clickPreview{

}

-(void)clickComfirmBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.selecteDelegate didSelectedAmPhoto:self.selectArray];
}

#pragma mark - get set
-(AmToolBarView *)toolBar{

    if (!_toolBar) {
        
        _toolBar = [[AmToolBarView alloc] init];
        _toolBar.frame = CGRectMake(0, Screen_Height - AM_ToolBarH, Screen_Width, AM_ToolBarH);
        _toolBar.delegate = self;
        
    }
    
    return _toolBar;
}

-(UICollectionView *)collectionView{

    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 74, Screen_Width - 20, Screen_Height - 74 - AM_ToolBarH) collectionViewLayout:[self getFolowLayout]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        UINib *cellNib = [UINib nibWithNibName:@"AmPhotoPikerImageCell" bundle: [NSBundle mainBundle]];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"AmPhotoPikerImageCell"];
    }
    
    return _collectionView;
}

@end
