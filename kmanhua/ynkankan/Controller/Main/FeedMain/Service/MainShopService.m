//
//  MainShopService.m
//  ynkankan
//
//  Created by aspn300 on 15/12/14.
//  Copyright (c) 2015年 cn.com.km.kankan. All rights reserved.
//

#import "MainShopService.h"
#import "UserSharePrefre.h"


#define page_Size 10

@implementation MainShopService


-(void)getManhuaById:(NSString *)manhuaId response:(void (^)(NSMutableDictionary *manhuaDic, NSError *error))response{
    
    /* manhua/getManhuaById.php*/
    
    
    NSString *requsetUrl = [NSString stringWithFormat:@"%@?manhuaid=%@", @"/kankanAdmin/GetManhuaById", manhuaId];

    [[HttpClient sharedClient] GET:requsetUrl parameters:nil
                          progress:^(NSProgress *downLoadProcess){
                          
                          }
                            success:^(NSURLSessionTask *task, id responseObject){
//                                NSLog(@"  >>>>> %@ ", responseObject);
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {
                                    response(nil, nil);
                                    
                                } else {
                                    
                                    if ([responseObject[@"data"] isEqual:[NSNull null]]) {
                                        response(nil, nil);
                                    } else{
                                        response(responseObject[@"data"][0], nil);
                                    }
                                    
                                    
                                }
                                
                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, error);
                            }];
    
    
}

/**
 *0.全部 1.招聘信息 2. 求职信息 3.房产信息 4.宠物信息
 *
 */
-(void)getManhuaList:(NSInteger)page type:(NSInteger)type response:(void (^)(NSMutableArray *freeManhua,  NSInteger pageCount, NSError *error))response{
    /* /manhua/getManhuaList.php  */
    NSString *requsetUrl = [NSString stringWithFormat:@"%@?page=%ld&type=%ld", @"/kankanAdmin/GetManhuaListByType", (long)page, type];
    NSLog(@" >>>>>>>>> %@  ", requsetUrl);
    [[HttpClient sharedClient] GET:requsetUrl parameters:nil
                          progress:^(NSProgress *downLoadProcess){
                              
                          }
                            success:^(NSURLSessionTask *task, id responseObject){
//                                NSLog(@"%@", responseObject);
                                if ([[responseObject objectForKey:@"error"] intValue] != 0) {

                                    response(nil, 0, nil);
                                
                                } else {
                                   
                                    if ([[responseObject objectForKey:@"data"] isEqual:[NSNull null]]) {
                                        response(nil, 0, nil);
                                    } else {
                                        
                                        NSMutableArray *array = [[NSMutableArray alloc] init];
                                        
                                        for (NSMutableDictionary *dic in [responseObject objectForKey:@"data"]) {
                                            
                                            NewsModel *model = [[NewsModel alloc] init];
                                            model.m_uid = [dic objectForKey:@"m_uid"];
                                            model.m_fromdata = [dic objectForKey:@"m_fromdata"];
                                            model.m_icon = [dic objectForKey:@"m_icon"];
                                            model.m_createTime = [dic objectForKey:@"m_createTime"];
                                            model.m_title = [dic objectForKey:@"m_title"];
                                            model.u_phoneno = [dic objectForKey:@"u_phoneno"];
                                            model.m_type = [dic objectForKey:@"m_type"];
                                            
                                            [array addObject:model];
                                        }
                                        
                                        
                                        response(array, [[responseObject objectForKey:@"count"] intValue], nil);

                                    
                                    }
                                    

                                }

                                
                            } failure:^(NSURLSessionTask *task, NSError *error){
                                response(nil, 0, error);
                            }];

}


-(void)updateManhuaContent:(NSMutableDictionary *)dic response:(void (^)(NSMutableDictionary *freeManhua, NSError *error))response{
    
//    NSDictionary *paramDic = @{@"manhuaName" : dic[@"manhuaName"] ,
//                               @"m_fromdata" : [[UserSharePrefre sharedInstance] nikeName] ,
//                               @"m_type" : dic[@"m_type"] ,
//                               @"u_phoneno" : dic[@"u_phoneno"] ,
//                               @"mcontent" : dic[@"mcontent"] ,
//                               @"imageList" : dic[@"imageList"] ,
//                               @"username" : [[UserSharePrefre sharedInstance] userId]};
    
    NSDictionary *paramDic = @{@"manhuaName" : dic[@"manhuaName"] ,
                               @"m_fromdata" : [[UserSharePrefre sharedInstance] nikeName] ,
                               @"m_type" : dic[@"m_type"] ,
                               @"u_phoneno" : dic[@"u_phoneno"] ,
                               @"mcontent" : dic[@"mcontent"] ,
                               @"imageList" : dic[@"imageList"] ,
                               @"username" : [[UserSharePrefre sharedInstance] userId]};
    
    NSLog(@" %@ ", paramDic);
    [[HttpClient sharedClient] POST:@"/kankanAdmin/UpdateManhuaContent" parameters:paramDic progress:nil
     
                            success:^(NSURLSessionTask *task, id responseObject){
                                
                                if ([[responseObject objectForKey:@"data"] isEqual:[NSNull null]]) {
                                    response(nil , nil);
                                } else {
                                    response(responseObject , nil);
                                }
                                
        
                            } failure:^(NSURLSessionTask *task, NSError *error){
    
    
    }];
    
}

-(void)updateImage:(NSMutableArray *)imageArray response:(void (^)(NSMutableDictionary *freeManhuaNSError, NSError *error))response{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    
    __block NSString *timeString = [NSString stringWithFormat:@"%f", a];

    
    
    [[HttpClient sharedClientUpdateImage] POST:@"/kankanAdmin/UploadImage"
                         parameters:@{@"imagetag" : timeString ,
                                      @"imagecout" : [NSString stringWithFormat:@"%lu", (unsigned long)imageArray.count] ,
                                      @"username" : [[UserSharePrefre sharedInstance] userId],
                                      @"deveice_id" : [[UserSharePrefre sharedInstance] UUID]}
                        constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                            
                            for (int i = 0; i < imageArray.count; i++) {
                                YMImage *ymimage = [imageArray objectAtIndex:i];
                             
                                NSString *stringtag = [NSString stringWithFormat:@"%@_%d", timeString, i];
                                
                                [formData appendPartWithFileData:UIImageJPEGRepresentation(ymimage.image, 1.0)
                                                            name:stringtag
                                                        fileName:[NSString stringWithFormat:@"%@.png",stringtag] mimeType:@"image/jpeg"];
                            }
                            

                        }
     
                        progress:^(NSProgress *downLoadProcess){
                            NSLog(@">>>>>>>>>");
                        }
     
                        success:^(NSURLSessionTask *task, id responseObject){
                     
                            if ([[responseObject objectForKey:@"data"] isEqual:[NSNull null]]) {
                                response(nil , nil);
                            } else {
                                response(responseObject , nil);
                            }
                        }
     
                        failure:^(NSURLSessionTask *task, NSError *error){
    
                            response(nil , error);
                        }];
    

    
}

@end
