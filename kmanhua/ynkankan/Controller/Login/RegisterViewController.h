//
//  RegisterViewController.h
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"

@protocol RegisterdDetailViewDelegate;

@interface RegisterViewController : UIViewController

@property (weak) id<RegisterdDetailViewDelegate> delegate;

@end

@protocol RegisterdDetailViewDelegate <NSObject>

-(void)registeSuccess;

@end

