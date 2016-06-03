//
//  ChooseTypeMainView.m
//  ynkankan
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "ChooseTypeMainView.h"
#import "AppConstant.h"

@interface ChooseTypeMainView(){

    NSInteger currentIndex;
}

@property (strong, nonatomic) UIView *chooseView;
@property (strong, nonatomic) UIButton *createButtom;

@end

@implementation ChooseTypeMainView

-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        [self addSubview:self.chooseView];
        [self addSubview:self.createButtom];
        [self setSelectionView:0];
    }
    
    return self;
}


-(void)setSelectionView:(NSInteger)selection{

    currentIndex = selection;
    
    for (int i = 0; i < 4; i ++) {
    
        UIImageView *imageView = [self.chooseView viewWithTag:100 + i];
        
        if (i == selection) {
          
            imageView.layer.borderColor = [Color_ButtonColor CGColor];
            imageView.layer.borderWidth = 3.0f;
            
        } else {
           
            imageView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            imageView.layer.borderWidth = 1.0f;
        }
        
    }

}

-(NSInteger)getCurrentIndex{

    return currentIndex + 1;
}

-(void)btnClick:(UIButton *)button{
//    NSLog(@" %@ ", button);
    [self setSelectionView:button.tag - 200];
    
}

-(void)btnConfirm:(UIButton *)button{

    if (self.delegate == nil) {
        
        return;
    }
    
    [self.delegate didClickConfrim];
}

-(UIView *)chooseView{

    if (!_chooseView) {
        
        _chooseView = [[UIView alloc] init];
        _chooseView.frame = CGRectMake(0, 30, kScreenWidth, (kScreenWidth / 3.0f) * 2);
//        _chooseView.backgroundColor = [UIColor grayColor];
        
        CGFloat viewX = 0.0f;
        CGFloat viewY = 20.0f;
        
        for (int i = 0; i < 4; i++) {
            
            viewX += 20.0f;
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(viewX, viewY, (kScreenWidth - 80.0f) / 3.0f, (kScreenWidth - 80.0f) / 3.0f);
//            imageView.backgroundColor = [UIColor redColor];
            imageView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            imageView.layer.borderWidth = 1.0f;
            imageView.layer.cornerRadius = ((kScreenWidth - 80.0f) / 3.0f) / 2.0f;
            
            imageView.tag  = 100 + i;
            
            UIButton *button = [[UIButton alloc] init];
            button.frame = CGRectMake(viewX, viewY, (kScreenWidth - 80.0f) / 3.0f, (kScreenWidth - 80.0f) / 3.0f);
            button.tag = 200 + i;
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if ((i + 1) % 3 == 0) {
                viewX = 0.0f;
                viewY += (kScreenWidth - 80.0f) / 3.0f + 20.0f;
            } else {
                viewX += (kScreenWidth - 80.0f) / 3.0f;
            }
            
            switch (i) {
              
                case 0:
                    [imageView setImage:[UIImage imageNamed:@"zhanpin_defualt_img"]];
                    break;
                
                case 1:
                    [imageView setImage:[UIImage imageNamed:@"qiuzhi_defualt_img"]];
                    break;
                
                case 2:
                    [imageView setImage:[UIImage imageNamed:@"fangcan_defualt_img"]];
                    break;
                
                case 3:
                    [imageView setImage:[UIImage imageNamed:@"congwu_defualt_img"]];
                    break;
                    
                default:
                    break;
            
            }
            
            
            [_chooseView addSubview:button];
            [_chooseView addSubview:imageView];
        }
        
        return _chooseView;
    }
    
    return _chooseView;

}

-(UIButton *)createButtom{
//(kScreenWidth - 80.0f) / 3.0f
    if (!_createButtom) {

        _createButtom = [[UIButton alloc] init];
        _createButtom.frame = CGRectMake(
                                         (kScreenWidth - (kScreenWidth - 80.0f) / 3.0f) / 2.0f,
                                         self.chooseView.frame.size.height + 30.0f, (kScreenWidth - 80.0f) / 3.0f,
                                         (kScreenWidth - 80.0f) / 3.0f);
        _createButtom.backgroundColor = Color_ButtonColor;
        _createButtom.layer.cornerRadius = ((kScreenWidth - 80.0f) / 3.0f) / 2.0f;
        _createButtom.titleLabel.font = [UIFont systemFontOfSize:20];
        [_createButtom setTitle:@"确认" forState:UIControlStateNormal];
        
        [_createButtom addTarget:self action:@selector(btnConfirm:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _createButtom;
}

@end
