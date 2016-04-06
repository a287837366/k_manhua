//
//  AmGourpViewCell.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AmPhotoGroupModel.h"

@interface AmGourpViewCell : UITableViewCell

@property (strong, nonatomic) AmPhotoGroupModel *model;

+(instancetype)initCell:(UITableView *)tableView;


@end
