//
//  LoginViewController.h
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController

@property (weak) id<LoginViewControllerDelegate> delegate;

@end

@protocol LoginViewControllerDelegate <NSObject>

-(void)loginSuccess;

@end
