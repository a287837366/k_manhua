//
//  MainCreateNewsVC.m
//  ynkankan
//
//  Created by aspn300 on 16/4/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainCreateNewsVC.h"
#import "MainCreateMainView.h"
#import "AmPhotoPikerViewController.h"
#import "AmPhotoHeader.h"
#import "MainShopService.h"

@interface MainCreateNewsVC ()<MainCreateMainViewDelegate, AmPhotoDidSelectedDelegate>
{

    MainCreateMainView *mainView;
    MainShopService *service;

}

@end

@implementation MainCreateNewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
 
}

-(void)initView{
    
    mainView = [[MainCreateMainView alloc] init];
    mainView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    mainView.delegate = self;
    [self.view addSubview:mainView];

    service = [[MainShopService alloc] init];
    
    [self initKeyboardListener];
}

-(void)initKeyboardListener{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [defaultCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)aNotification{
    [mainView keyBoardShow:[self getKeyboardHeight:aNotification]];
}

-(void)keyboardWillHide:(NSNotification *)aNotification{
    [mainView keyBoardHide];
}



#pragma mark - MainCreateMainViewDelegate
-(void)gotoSelectPhoto:(NSInteger)maxCount{
    
    AmPhotoPikerViewController *viewC = [[AmPhotoPikerViewController alloc] init];
    viewC.selecteDelegate = self;
    viewC.maxCount = maxCount;
    [self presentViewController:viewC animated:YES completion:nil];
    
}

#pragma mark - 选择照片回调
-(void)didSelectedAmPhoto:(NSMutableArray *)photoArray{
    [mainView setImageByArray:photoArray];
}

#pragma mark - Action
- (IBAction)clickCancle:(id)sender {
    

    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)createNews:(id)sender {
    
    if (![mainView checkInputFiled])
    {
        return;
    }

    __weak typeof(self) weakSelf = self;
    
    
    [service updateImage:[mainView getImageArray] response:^(NSMutableDictionary * dic, NSError *error){
    
        if (error == nil) {
            [weakSelf updateContent:dic[@"data"]];
        }
        
        
    }];

}

-(void)updateContent:(NSString *)imageList{
    

    [mainView.inputParam setObject:@"2" forKey:@"m_type"];
    [mainView.inputParam setObject:imageList forKey:@"imageList"];
    [service updateManhuaContent:mainView.inputParam response:^(NSMutableDictionary *dic, NSError *error){
    
    
    }];
}

#pragma mark - 获取键盘的高度
-(CGFloat)getKeyboardHeight:(NSNotification *)aNotification{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    return keyboardRect.size.height;
}


@end
