//
//  AmPhotoGroupViewController.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "BaseViewController.h"

@protocol AmPhotoGroupViewDelegate;

@interface AmPhotoGroupViewController : UIViewController

//可选择最大数量
@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, weak) id<AmPhotoDidSelectedDelegate> selecteDelegate;

@end
