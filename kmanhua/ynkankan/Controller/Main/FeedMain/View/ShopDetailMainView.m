//
//  ShopDetailMainView.m
//  ynkankan
//
//  Created by aspn300 on 16/1/10.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import "ShopDetailMainView.h"
#import "UIImageView+WebCache.h"
#import "AppConstant.h"

@interface ShopDetailMainView()

@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *createLable;
@property (strong, nonatomic) UIView *lineView;

@property (strong, nonatomic) UIView *underLine;
@property (strong, nonatomic) UIView *bottomView;

@end


@implementation ShopDetailMainView

-(void)createViewByArray:(NSArray *)viewArray{

    
    //[[-----------标题--------------
    self.titleLable.frame = CGRectMake(10, 19, kScreenWidth - 20, 18);
    self.titleLable.text = [self.dataModel objectForKey:@"m_name"];
    [self addSubview:self.titleLable];
    //-----------标题--------------]]
    
    self.viewHeight += 52;
   
    //[[-----------创建日期--------------
    self.createLable.frame = CGRectMake(10, self.viewHeight, kScreenWidth - 20, 12);
    self.createLable.text = [NSString stringWithFormat:@"%@  %@",[self.dataModel objectForKey:@"m_createTime"], @"쨈쨈"];
    [self addSubview:self.createLable];
    //-----------创建日期--------------]]
    
    self.viewHeight += 22;
    
    //[[--------横线---------
    self.lineView.frame = CGRectMake(0, self.viewHeight, kScreenWidth, 1);
    [self addSubview:self.lineView];
    //--------横线---------]]
    
    self.viewHeight += 10;
    
    for (NSDictionary *viewDic in viewArray) {
       
        [self createViewByType:viewDic];
    }

    self.viewHeight += 10;
    
    //[[--------横线---------
    self.underLine.frame = CGRectMake(0, self.viewHeight, kScreenWidth, 1);
    [self addSubview:self.underLine];
    //--------横线---------]]
    
    self.bottomView.frame = CGRectMake(0, self.viewHeight, kScreenWidth, 100);
    [self addSubview:self.bottomView];
    self.viewHeight += 100;
    
}

-(void)createViewByType:(NSDictionary *)viewDic{

    if ([[viewDic objectForKey:@"type"] isEqualToString:@"image"]) {
        
        CGFloat height = ([[viewDic objectForKey:@"height"] intValue] * kScreenWidth) / [[viewDic objectForKey:@"width"] intValue];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, self.viewHeight, kScreenWidth, height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView sd_setImageWithURL:[NSURL URLWithString:[viewDic objectForKey:@"content"]]];
        [self addSubview:imageView];
        
        self.viewHeight += height;
    } else if ([[viewDic objectForKey:@"type"] isEqualToString:@"lable"]){
       
        self.viewHeight += 10;
        
        NSString *title = [viewDic objectForKey:@"content"];
        
        CGSize lableSize = [self boundingRectWithSize:title Font:[UIFont systemFontOfSize:13] size:CGSizeMake(kScreenWidth - 20, MAXFLOAT)];
        
        UILabel *lable = [[UILabel alloc] init];
        lable.frame = CGRectMake(10, self.viewHeight, kScreenWidth - 20, lableSize.height);
        lable.numberOfLines = 0;
        lable.font = [UIFont systemFontOfSize:13];
        lable.textColor = Color_666666;
        lable.text = title;
        
        [self addSubview:lable];
        self.viewHeight += 10 + lableSize.height;
    }
    
}


#pragma mark - get set
-(UILabel *)titleLable{

    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = [UIColor darkGrayColor];
        _titleLable.font = [UIFont boldSystemFontOfSize:18];
    }

    return _titleLable;
}

-(UILabel *)createLable{

    if (!_createLable) {
        
        _createLable = [[UILabel alloc] init];
        _createLable.font = [UIFont systemFontOfSize:12];
        _createLable.textColor = Color_666666;
        
    }

    return _createLable;
}

-(UIView *)lineView{

    if (!_lineView) {
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = Color_eeeeee;
        
    }
    
    return _lineView;

}

-(UIView *)underLine{

    if (!_underLine) {
        
        _underLine = [[UIView alloc] init];
        _underLine.backgroundColor = Color_eeeeee;
        
    }

    return _underLine;
}

-(UIView *)bottomView{

    if (!_bottomView) {
        
        _bottomView = [[UIView alloc] init];
        
    }

    return _bottomView;
}


#pragma mark 根据内容拿到 控件宽度
-(CGSize) boundingRectWithSize:(NSString*) txt Font:(UIFont*) font size:(CGSize)size{
    CGSize _size;
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    NSStringDrawingOptions options =
    NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    _size = [txt boundingRectWithSize:size options: options attributes:attribute context:nil].size;
    
    return _size;
}


@end
