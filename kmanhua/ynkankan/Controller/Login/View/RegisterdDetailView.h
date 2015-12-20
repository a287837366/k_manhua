//
//  RegisterdDetailView.h
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterdDetailView : UIView

@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *nikeNameText;
@property (weak, nonatomic) IBOutlet UITextField *pwText;
@property (weak, nonatomic) IBOutlet UITextField *pwConfirmText;


@property (weak, nonatomic) IBOutlet UIButton *btnCenter;

-(NSMutableDictionary *)getUserInfo;

@end

