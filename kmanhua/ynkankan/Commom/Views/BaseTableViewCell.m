//
//  BaseTableViewCell.m
//  ynkankan
//
//  Created by aspn300 on 15/10/11.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
