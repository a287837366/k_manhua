//
//  AmPhotoPikerTools.m
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmPhotoPikerTools.h"
#import "AmPhotoGroupModel.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface AmPhotoPikerTools ()
@property (nonatomic , strong) ALAssetsLibrary *library;
@end

@implementation AmPhotoPikerTools

+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred,^
                  {
                      library = [[ALAssetsLibrary alloc] init];
                  });
    return library;
}

- (ALAssetsLibrary *)library
{
    if (nil == _library)
    {
        _library = [self.class defaultAssetsLibrary];
    }
    
    return _library;
}

-(void)getAllGroupWithPhotos:(callBackBlock)callBack{
    
    NSMutableArray *groups = [NSMutableArray array];
    
    ALAssetsLibraryGroupsEnumerationResultsBlock resultBlock = ^(ALAssetsGroup *group, BOOL *stop){
        
        if (group) {
            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            
            AmPhotoGroupModel *model = [[AmPhotoGroupModel alloc] init];
            model.group = group;
            model.groupName = [group valueForProperty:@"ALAssetsGroupPropertyName"];
            model.assetsCount = [group numberOfAssets];
            model.thumbImage = [UIImage imageWithCGImage:[group posterImage]];

            [groups addObject:model];
        } else {
            callBack(groups);
        }

    };
    
    [self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:resultBlock failureBlock:nil];
}


- (void) getGroupPhotosWithGroup : (AmPhotoGroupModel *) pickerGroup finished : (callBackBlock ) callBack{

    NSMutableArray *assets = [NSMutableArray array];
    
    
    
    ALAssetsGroupEnumerationResultsBlock result = ^(ALAsset *asset , NSUInteger index , BOOL *stop){
        
        
        if (asset) {
            [assets addObject:asset];
        }else{
            callBack(assets);
        }
    };
    
    
    
    [pickerGroup.group enumerateAssetsUsingBlock:result];
}

@end
