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
#import "MBProgressHUD+ToastDialog.h"
#import "CustomProgressHUD.h"

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
    [self setLeftButton];
    [self setRigthButton];
    [self setTitle:@"创建"];
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

#pragma mark 返回
-(void)setLeftButton {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark 返回
-(void)closeMethod{
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark Navagation 右侧按钮
- (void)setRigthButton{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"确认", nil) style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark 右侧action
-(void)clickRightButton{
    
    if ([mainView checkInputFiled]){
    
        if ([mainView getImageArray].count == 0) {
            [CustomProgressHUD showHUD:mainView];
            
            [self updateContent:@""];
        } else {
            [CustomProgressHUD showHUD:mainView];
            [self createNews:nil];
        }
        
    }
    
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
    
    __weak typeof(self) weakSelf = self;

    [mainView.inputParam setObject:[NSString stringWithFormat:@"%ld", (long)self.newsType] forKey:@"m_type"];
    [mainView.inputParam setObject:imageList forKey:@"imageList"];
    [service updateManhuaContent:mainView.inputParam response:^(NSMutableDictionary *dic, NSError *error){
    
    
        if (error == NULL) {
            
//            [weakSelf.delegate didSuccessCreate];
            [MBProgressHUD Toast:nil withText:@"创建成功"];
            [CustomProgressHUD hideHUD:weakSelf.view];
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        }
        
        
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
