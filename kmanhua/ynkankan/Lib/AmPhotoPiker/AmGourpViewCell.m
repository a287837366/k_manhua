//
//  AmGourpViewCell.m
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmGourpViewCell.h"

#define kAmGourpViewCell @"AmGourpViewCell"

@interface AmGourpViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageThumb;
@property (weak, nonatomic) IBOutlet UILabel *photoName;

@end


@implementation AmGourpViewCell

+(instancetype)initCell:(UITableView *)tableView{

    static NSString *identifierItem = kAmGourpViewCell;
    
    AmGourpViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierItem];
    
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifierItem owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return cell;
    
}

-(void)setModel:(AmPhotoGroupModel *)model{
    _model = model;
    
    self.imageThumb.image = model.thumbImage;
    self.photoName.text = [NSString stringWithFormat:@"%@(%ld)", model.groupName, (long)model.assetsCount];

}

@end
