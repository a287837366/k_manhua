//
//  WeiXin.m
//  uniplaza
//  微信分享
//  Created by Xi Jin on 19/08/2015.
//  Copyright (c) 2015 YouMi. All rights reserved.
//

#import "WeiXin.h"


#define kHttp @"http://"

@implementation WeiXin

#pragma mark - 微信分享
+(void)WeixinShare:(NSString *)title andDesc:(NSString *)desc andUrl:(NSString *)link withImgUrl:(NSString *)imgUrl isGroup:(BOOL)isGroup{
    
    __weak typeof(self) weakSelf = self;
    
    //网络图片
    if([imgUrl rangeOfString:kHttp].length !=0){
        NSLog(@"分享链接 ===> %@", link);
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imgUrl]                                                          options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize){
        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished){
            NSLog(@"WeixinShare 网络图片");
            
            NSData *dataObj = [weakSelf imageWithImage:image scaledToSize:CGSizeMake(100, 100)];
            
            
            NSLog(@"  %lu KB ", (unsigned long)dataObj.length  / 1024);
            [WeiXin share:title andDesc:desc andUrl:link withUIimage:[UIImage imageWithData:dataObj] isGroup:isGroup];
        }];
        //本地图片
    }else{
        NSLog(@"分享链接 ===> %@", link);
        [WeiXin share:title andDesc:desc andUrl:link withUIimage:[UIImage imageNamed:imgUrl] isGroup:isGroup];
    }
}

+ (NSData *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.1);
}

+(void)WeixinShare:(NSString *)title andDesc:(NSString *)desc andUrl:(NSString *)link withImgUrl:(NSString *)imgUrl isGroup:(BOOL)isGroup complate:(WXShareComplete) complete{
    //网络图片
    if([imgUrl rangeOfString:kHttp].length !=0){
        
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imgUrl]                                                          options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize){
        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished){
            
            if (error == nil) {
                complete(YES);
                
                NSData *dataObj = UIImageJPEGRepresentation(image, 0.1);
                NSLog(@"  %lu KB ", (unsigned long)dataObj.length  / 1024);
                
                [WeiXin share:title andDesc:desc andUrl:link withUIimage:[UIImage imageWithData:dataObj] isGroup:isGroup];
            } else {
                complete(NO);
            }
            
            
            
        }];
        //本地图片
    }else{
        NSLog(@"分享链接 ===> %@", link);
        [WeiXin share:title andDesc:desc andUrl:link withUIimage:[UIImage imageNamed:imgUrl] isGroup:isGroup];
    }
    
}

+(void)WeixinShare:(NSString *)title andDesc:(NSString *)desc andUrl:(NSString *)link image:(UIImage *)image isGroup:(BOOL)isGroup{
    [WeiXin share:title andDesc:desc andUrl:link withUIimage:image isGroup:isGroup];
}


+(void)share:(NSString *)title andDesc:(NSString *)desc andUrl:(NSString *)link withUIimage:(UIImage *)img isGroup:(BOOL)isGroup{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = desc;
    [message setThumbImage:img];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = link;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = isGroup? WXSceneTimeline: WXSceneSession;
    
    [WXApi sendReq:req];
}

@end
