//
//  MeFeedBackController.m
//  ynkankan
//
//  Created by apple on 15/12/14.
//  Copyright © 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MeFeedBackController.h"

@interface MeFeedBackController ()<UITextViewDelegate>

@end

@implementation MeFeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    self.view.backgroundColor = Color_Background;
    [self setTitle:@"의견제출"];
    [self setLeftButton];
    [self setRigthButton];
    self.feedBackText.delegate = self;
}

#pragma mark 返回
-(void)setLeftButton {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_top_back"] style:UIBarButtonItemStylePlain target:self action:@selector(closeMethod)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark 返回
-(void)closeMethod{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark Navagation 右侧按钮
- (void)setRigthButton{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"확인 ", nil) style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark 右侧action
-(void)clickRightButton{
    
    if (self.feedBackText.text.length == 0) {
        
        [MBProgressHUD Toast:nil withText:@"의견을 입력 해주세요."];
        return;
    }
    
    self.feedBackText.text = @"";
    self.hintLable.hidden = NO;
    
    [MBProgressHUD Toast:nil withText:@"좋은 의견 감사합니다."];
    [self closeMethod];
}

-(void)textViewDidChange:(UITextView *)textView{

    if (textView.text.length != 0) {
        self.hintLable.hidden = YES;
        return;
    }
    
     self.hintLable.hidden = NO;
}
#pragma mark - textViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
