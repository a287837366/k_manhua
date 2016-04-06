//
//  AmPhotoPikerTools.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AmPhotoGroupModel.h"

typedef void(^callBackBlock)(id obj);

@interface AmPhotoPikerTools : NSObject


/** 
 * 获取图片组
 */
-(void)getAllGroupWithPhotos:(callBackBlock)callBack;

/**
 * 传入一个组获取组里面的Asset
 */
- (void) getGroupPhotosWithGroup : (AmPhotoGroupModel *) pickerGroup finished : (callBackBlock ) callBack;

@end
