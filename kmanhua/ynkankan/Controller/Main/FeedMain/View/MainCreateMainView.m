//
//  MainCreateMainView.m
//  ynkankan
//
//  Created by aspn300 on 16/4/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "MainCreateMainView.h"
#import "YMnineImageView.h"
#import "AppConstant.h"
#import "AmPhotoHeader.h"
#import "AmPhotoPikerViewController.h"
#import "AmPhotoAssets.h"
#import "MBProgressHUD+ToastDialog.h"

#define viewTotal 289

@interface MainCreateMainView()<YMnineIamgeViewDelegate>{

    UIScrollView *mainScroll;
    
    
    UILabel *titleLable;
    UITextField *textTitle;
    
    UILabel *commentLable;
    UITextView *textComment;
    
    UILabel *phoneLable;
    UITextField *textPhone;
    
    YMnineImageView *chooseView;
    
    BOOL keyBoradrShow;

}

@end

@implementation MainCreateMainView

-(instancetype)init{

    if (self = [super init]) {
        
        keyBoradrShow = NO;
        
        mainScroll = [[UIScrollView alloc] init];
        mainScroll.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
       
        //[[[[[--------标题标题
        titleLable = [[UILabel alloc] init];
        titleLable.frame = CGRectMake(30, 15, kScreenWidth - 60, 16);
        titleLable.font = [UIFont systemFontOfSize:15];
        titleLable.textColor = Color_666666;
        titleLable.text = @"标题";
        
        //[[[[[--------标题输入框
        textTitle = [[UITextField alloc] init];
        textTitle.frame = CGRectMake(40, 35, kScreenWidth -  70, 40);
        textTitle.font = [UIFont systemFontOfSize:14];
        
        //[[[[[--------分割线
        UIView *lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(30, 71, kScreenWidth - 60, 0.5);
        lineView.backgroundColor = Color_888888;
        
        UIView *lineView2 = [[UIView alloc] init];
        lineView2.frame = CGRectMake(30, 38, 0.5, 34);
        lineView2.backgroundColor = Color_888888;
        
        
        //[[[[[--------内容标题
        commentLable = [[UILabel alloc] init];
        commentLable.frame = CGRectMake(30, 86, kScreenWidth - 60, 16);
        commentLable.font = [UIFont systemFontOfSize:15];
        commentLable.textColor = Color_666666;
        commentLable.text = @"内容";
        
        //[[[[[--------内容输入框
        textComment = [[UITextView alloc] init];
        textComment.frame = CGRectMake(40, 110, kScreenWidth - 70, 95);
        textComment.font = [UIFont systemFontOfSize:14];
        textComment.textColor = Color_888888;
        

        //[[[[[--------分割线
        UIView *lineView3 = [[UIView alloc] init];
        lineView3.frame = CGRectMake(30, 110, 0.5, 100);
        lineView3.backgroundColor = Color_888888;
        
        UIView *lineView4 = [[UIView alloc] init];
        lineView4.frame = CGRectMake(30, 210, kScreenWidth - 60, 0.5);
        lineView4.backgroundColor = Color_888888;
        
        //[[[[[--------电话号码标题
        phoneLable = [[UILabel alloc] init];
        phoneLable.frame = CGRectMake(30, 225, kScreenWidth - 60, 16);
        phoneLable.font = [UIFont systemFontOfSize:15];
        phoneLable.textColor = Color_666666;
        phoneLable.text = @"电话号码";
        
        //[[[[[--------电话号码输入框
        textPhone = [[UITextField alloc] init];
        textPhone.frame = CGRectMake(40, 245, kScreenWidth - 70, 34);
        textPhone.font = [UIFont systemFontOfSize:14];
        textPhone.keyboardType = UIKeyboardTypePhonePad;
        textPhone.textColor = Color_888888;
        
        //[[[[[--------分割线
        UIView *lineView5 = [[UIView alloc] init];
        lineView5.frame = CGRectMake(30, 245, 0.5, 34);
        lineView5.backgroundColor = Color_888888;
        
        UIView *lineView6 = [[UIView alloc] init];
        lineView6.frame = CGRectMake(30, 279, kScreenWidth - 60, 0.5);
        lineView6.backgroundColor = Color_888888;
        
        //[[[[[---------选择图片
        chooseView = [[YMnineImageView alloc] init];
        chooseView.delegate = self;
        chooseView.frame = CGRectMake(30, 289, kScreenWidth - 60, (Screen_Width - 60 ) / 3);
        
        
        [mainScroll addSubview:lineView];
        [mainScroll addSubview:lineView2];
        [mainScroll addSubview:titleLable];
        [mainScroll addSubview:textTitle];

        [mainScroll addSubview:commentLable];
        [mainScroll addSubview:textComment];
        [mainScroll addSubview:lineView4];
        [mainScroll addSubview:lineView3];
      
        [mainScroll addSubview:phoneLable];
        [mainScroll addSubview:textPhone];
        [mainScroll addSubview:lineView5];
        [mainScroll addSubview:lineView6];
        
        [mainScroll addSubview:chooseView];
        
        [self refreshContent:(Screen_Width - 60) / 3];
        
        [self addSubview:mainScroll];
    }

    return self;
}

#pragma mark 刷新可滚动位置
-(void)refreshContent:(CGFloat)height{
    
    if (Screen_Height - 64 > viewTotal + height) {
       mainScroll.contentSize = CGSizeMake(0, Screen_Height - 63);
    } else {
        mainScroll.contentSize = CGSizeMake(0, viewTotal + height);
    }
    
    
}

#pragma mark - 添加图片
-(void)setImageByArray:(NSMutableArray *)array{

    for (AmPhotoAssets *photoAssets in array) {
        [chooseView addLocalImageWithUIimage:photoAssets.thumbImage];
    }
    [chooseView reloadYMnineView];
}

-(NSMutableArray *)getImageArray{

    return [chooseView getImageListByImageType:YMImageTypeLocalImage];
}
-(void)keyBoardShow:(CGFloat)keyboardH{
    
    if (!keyBoradrShow) {
        mainScroll.contentSize = CGSizeMake(0, chooseView.frame.origin.y + chooseView.frame.size.height + keyboardH + 10);
    }

    keyBoradrShow = YES;
}
-(void)keyBoardHide{
    [textComment resignFirstResponder];
    [textPhone resignFirstResponder];
    [textTitle resignFirstResponder];
    
    keyBoradrShow = NO;
}

-(BOOL)checkInputFiled{

    if (textTitle.text.length <= 0) {
        [MBProgressHUD Toast:nil withText:@"请输入标题"];
        NSLog(@"请输入标题");
        return false;
    }
    
    if (textComment.text.length <= 0) {
        NSLog(@"请输入内容");
        [MBProgressHUD Toast:nil withText:@"请输入内容"];
        return false;
    }

    return YES;
}


-(NSMutableDictionary *)inputParam{

    if (!_inputParam) {
        
        _inputParam = [[NSMutableDictionary alloc] init];
        
    }

    [_inputParam setObject:textTitle.text forKey:@"manhuaName"];
    [_inputParam setObject:textPhone.text forKey:@"u_phoneno"];
    [_inputParam setObject:textComment.text forKey:@"mcontent"];

    
    return _inputParam;
}
#pragma mark - YMnineIamgeViewDelegate
-(void)didClickAddButton{
    [self.delegate gotoSelectPhoto: 9 - [[chooseView getImageListByImageType:YMImageTypeLocalImage] count]];
}

-(void)heightIsChange:(CGFloat)height{
    [self refreshContent:height];
    
}


@end
