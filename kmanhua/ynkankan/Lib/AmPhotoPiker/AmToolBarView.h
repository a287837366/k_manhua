//
//  AmToolBarView.h
//  chooseImage
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 chooseImage. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AmToolBarViewDelegate;

@interface AmToolBarView : UIView

@property (nonatomic, weak) id<AmToolBarViewDelegate> delegate;

/**
    更新选择图片的数量，如果是0按钮就会变灰色数量空间会隐藏掉
 */
-(void)setCount:(NSInteger)count;

@end


@protocol AmToolBarViewDelegate <NSObject>

-(void)clickPreview;

-(void)clickComfirmBtn;

@end