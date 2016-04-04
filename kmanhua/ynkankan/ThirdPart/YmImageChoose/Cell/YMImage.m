//
//  YMImage.m
//  YMChooseImageView
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 mHelloWorld. All rights reserved.
//

#import "YMImage.h"

@implementation YMImage

-(instancetype)initWithType:(YMImageType)type{
    self = [super init];
   
    if (self) {
        self.type = type;
    }

    return self;
}

-(YMImageDeleteType)deleteType{

    if (!_deleteType) {
        _deleteType = YMImageDeleteTypeDefualtImage;
    }
    
    return _deleteType;

}

@end
