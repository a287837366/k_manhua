//
//  RegisterdDetailView.m
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "RegisterdDetailView.h"
#import "ToolsClass.h"

@implementation RegisterdDetailView

-(NSMutableDictionary *)getUserInfo{
    
    //需要添加 判断各种逻辑
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:self.usernameText.text forKey:@"username"];
    [dic setObject:[ToolsClass stringToMd5:self.pwText.text] forKey:@"userpw"];
    [dic setObject:self.nikeNameText.text forKey:@"usernikename"];
    
    return dic;
}

@end
