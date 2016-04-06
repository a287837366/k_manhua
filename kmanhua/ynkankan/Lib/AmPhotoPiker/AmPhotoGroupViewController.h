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

@property (nonatomic, assign) id<AmPhotoGroupViewDelegate> delegate;

//可选择最大数量
@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, weak) id<AmPhotoDidSelectedDelegate> selecteDelegate;

@end


@protocol AmPhotoGroupViewDelegate <NSObject>

-(void)goBack;

@end
