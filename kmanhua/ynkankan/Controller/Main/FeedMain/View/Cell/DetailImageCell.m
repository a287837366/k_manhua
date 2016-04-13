//
//  DetailImageCell.m
//  ynkankan
//
//  Created by aspn300 on 16/4/12.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "DetailImageCell.h"
#import "UIImageView+WebCache.h"

#define K_DetailImageCell @"DetailImageCell"

@implementation DetailImageCell

+(DetailImageCell *)initCell:(UITableView *)tableView
{
    static NSString *CellIdentifier = K_DetailImageCell;
    
    DetailImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] lastObject];
    }

    return cell;
}

-(void)imageUrl:(NSString *)imgUrl
{
    self.detailPage.image = [UIImage imageNamed:@"detailpage.jpg"];
//    [self.detailPage sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
}

@end
