//
//  DetailImageCell.h
//  ynkankan
//
//  Created by aspn300 on 16/4/12.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailImageCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *detailPage;
@property (strong, nonatomic) NSString *urlString;

+(DetailImageCell *)initCell:(UITableView *)tableView;

-(void)imageUrl:(NSString *)imgUrl;

@end
