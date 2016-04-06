//
//  AmPhotoGroupModel.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

@interface AmPhotoGroupModel : NSObject

/** 组名 */
@property (nonatomic, copy) NSString *groupName;
/** 缩略图 */
@property (nonatomic, strong) UIImage *thumbImage;
/** 组里面的图片个数 */
@property (nonatomic , assign) NSInteger assetsCount;

@property (nonatomic , strong) ALAssetsGroup *group;

@end
