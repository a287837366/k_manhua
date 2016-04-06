//
//  AmToolBarView.m
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import "AmToolBarView.h"
#import "AmPhotoHeader.h"

@interface AmToolBarView()
{
    UIButton *confirmButton;
    UIButton *selectButton;

}

@property (strong, nonatomic) UILabel *countLable;

@end

@implementation AmToolBarView

-(instancetype)init{

    if (self = [super init]) {
        NSLog(@"AmToolBarView :: init");
        UIView *lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(0, 0, Screen_Width, 0.5);
        lineView.backgroundColor = [UIColor lightGrayColor];
        
        selectButton = [[UIButton alloc] init];
        selectButton.frame = CGRectMake(0, 0, 70, AM_ToolBarH);
        selectButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [selectButton setTitle:@"预览" forState:UIControlStateNormal];
        [selectButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [selectButton addTarget:self action:@selector(previewPhotos:) forControlEvents:UIControlEventTouchUpInside];
        selectButton.hidden = YES;
        
        confirmButton = [[UIButton alloc] init];
        confirmButton.frame = CGRectMake(Screen_Width - 100 - 20, 0, 100, AM_ToolBarH);
        confirmButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        confirmButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [confirmButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [confirmButton addTarget:self action:@selector(clickComfirmButton:) forControlEvents:UIControlEventTouchUpInside];
        confirmButton.userInteractionEnabled = NO;
        
        
        self.countLable.hidden = YES;
        [self addSubview:self.countLable];

        [self addSubview:confirmButton];
        [self addSubview:selectButton];
        [self addSubview:lineView];
    }

    return self;
}

#pragma mark - <Action>
//点击预览图片
-(void)previewPhotos:(UIButton *)button{
    NSLog(@"预览照片");
    
    if (self.delegate == nil) {
        return;
    }

    [self.delegate clickPreview];
}
//点击确认按钮
-(void)clickComfirmButton:(UIButton *)button
{
    
    [self.delegate clickComfirmBtn];
}


#pragma mark - <Public>
-(void)setCount:(NSInteger)count{

    /** 
     如果传过来的数字是0 确定按钮变成灰色 隐藏数量控件 
     如果大于0那就显示出来
     注意:不动能于设置的最大数量（最大数量默认9）
     */
    if (count <= 0) {
        self.countLable.hidden = YES;
        self.countLable.text = @"0";
        [confirmButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        confirmButton.userInteractionEnabled = NO;
        
        return;
    }
    
    self.countLable.hidden = NO;
    self.countLable.text = [NSString stringWithFormat:@"%ld", (long)count];
    
    [confirmButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    confirmButton.userInteractionEnabled = YES;
    
    
}

-(UILabel *)countLable{

    if (!_countLable) {
        
        _countLable = [[UILabel alloc] init];
        _countLable.frame = CGRectMake(Screen_Width - 69, (AM_ToolBarH - 15 )/ 2, 15, 15);
        _countLable.backgroundColor = [UIColor redColor];
        _countLable.layer.cornerRadius = 7.5;
        _countLable.layer.masksToBounds = YES;
        _countLable.font = [UIFont systemFontOfSize:12];
        _countLable.textColor = [UIColor whiteColor];
        _countLable.textAlignment = NSTextAlignmentCenter;
        _countLable.text = @"1";
    }

    return _countLable;
}


@end
