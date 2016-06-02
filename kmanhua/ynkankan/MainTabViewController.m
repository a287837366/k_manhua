//
//  MainTabViewController.m
//  ynkankan
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainTabViewController.h"
#import "MainShopViewController.h"
#import "MeViewController.h"
#import "ChooseTypeVC.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tabBar.tintColor = Color_ButtonColor;
    [self initialControllers];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化子控制器
-(void)initialControllers {
    
    [self setupController:[[MainShopViewController alloc]init] image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"精华"];
    [self setupController:[[ChooseTypeVC alloc]init] image:@"tabBar_publish_icon" selectedImage:@"tabBar_publish_click_icon" title:@"发布"];
    [self setupController:[[MeViewController alloc]init] image:@"tabBar_me_icon"  selectedImage:@"tabBar_me_click_icon" title:@"我"];
    
    
}


//设置控制器
-(void)setupController:(UIViewController *)childVc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    UIViewController *viewVc = childVc;
    viewVc.tabBarItem.image = [UIImage imageNamed:image];
    viewVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    viewVc.tabBarItem.title = title;
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:viewVc];
    [self addChildViewController:navi];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
