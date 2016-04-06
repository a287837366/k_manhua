//
//  AmPhotoHeader.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#ifndef AmPhotoHeader_h
#define AmPhotoHeader_h

#import "AmPhotoAssets.h"

#define Background_Color [UIColor whiteColor]
//#888888
#define NavigationTitle_Color [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1.0f]



#define Screen_Width  [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height

#define AM_ToolBarH 40     


#define Image_SelectionDefualt @"amphotosdefualt"
#define Image_SelectionSeleted @"amphotoseleted"


@protocol AmPhotoDidSelectedDelegate <NSObject>

-(void)didSelectedAmPhoto:(NSMutableArray *)photoArray;

@end

#endif /* AmPhotoHeader_h */
