//
//  AmPhotoPikerViewController.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//
#import "AmPhotoHeader.h"
#import "BaseViewController.h"


@interface AmPhotoPikerViewController : UIViewController

/** 
    可以选择的 最大数量。默认为9
 */
@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, weak) id<AmPhotoDidSelectedDelegate> selecteDelegate;

@end



