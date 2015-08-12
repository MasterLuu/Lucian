//
//  MyDownloader.h
//  DownloaderWithBlock
//
//  Created by gaokunpeng on 15/8/8.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDownloader : NSObject
/*
 @param urlString:下载的链接
 @param finishBlock:下载成功调用的代码块
 @param failBlock:下载失败调用的代码块
 */
- (void)downloadWithUrlString:(NSString *)urlString finish:(void (^)(NSData *))finishBlock fail:(void (^)(NSError *))failBlock;
//int a;
//void (^finishBlock)(NSData *);

@end
