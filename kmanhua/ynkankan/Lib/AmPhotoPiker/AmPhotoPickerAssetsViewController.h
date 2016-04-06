//
//  AmPhotoPickerAssetsViewController.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AmPhotoGroupModel.h"
#import "AmPhotoHeader.h"

@interface AmPhotoPickerAssetsViewController : UIViewController

@property (nonatomic, strong) AmPhotoGroupModel *groupModel;

@property (nonatomic, weak) id<AmPhotoDidSelectedDelegate> selecteDelegate;

@end
