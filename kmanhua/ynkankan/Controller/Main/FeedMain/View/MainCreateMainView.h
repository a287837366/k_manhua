//
//  MainCreateMainView.h
//  ynkankan
//
//  Created by aspn300 on 16/4/2.
//  Copyright © 2016年 cn.com.km.kankan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainCreateMainViewDelegate;

@interface MainCreateMainView : UIView

@property(strong, nonatomic) NSMutableDictionary *inputParam;

@property (weak, nonatomic) id<MainCreateMainViewDelegate> delegate;

-(void)setImageByArray:(NSMutableArray *)array;

-(void)keyBoardShow:(CGFloat)keyboardH;
-(void)keyBoardHide;

-(BOOL)checkInputFiled;

-(NSMutableArray *)getImageArray;

@end


@protocol MainCreateMainViewDelegate <NSObject>

-(void)gotoSelectPhoto:(NSInteger)maxCount;

@end
