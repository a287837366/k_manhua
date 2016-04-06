//
//  AmPhotoPikerViewController.m
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmPhotoPikerViewController.h"
#import "AmPhotoGroupViewController.h"



@interface AmPhotoPikerViewController ()

@end

@implementation AmPhotoPikerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavigation];
}


- (void)initNavigation{
    
    AmPhotoGroupViewController *groupVc = [[AmPhotoGroupViewController alloc] init];
    groupVc.selecteDelegate = self.selecteDelegate;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:groupVc];
    
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:NavigationTitle_Color, NSForegroundColorAttributeName, nil];
    [nav.navigationBar setTitleTextAttributes:dict];
    [nav.navigationBar setTintColor:NavigationTitle_Color];
    
    nav.view.frame = self.view.bounds;

    [self addChildViewController:nav];
    [self.view addSubview:nav.view];
    
}


-(void)goBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
