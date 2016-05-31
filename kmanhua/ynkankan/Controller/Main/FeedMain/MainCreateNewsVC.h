//
//  MainCreateNewsVC.h
//  ynkankan
//
//  Created by aspn300 on 16/4/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "BaseViewController.h"

@protocol MainCreateNewsVCDelegate ;

@interface MainCreateNewsVC : BaseViewController 

@property (assign, nonatomic) NSInteger newsType;

@property (weak, nonatomic) id<MainCreateNewsVCDelegate> delegate;

@end


@protocol MainCreateNewsVCDelegate <NSObject>

-(void)didSuccessCreate;

@end
