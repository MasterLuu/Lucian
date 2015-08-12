//
//  MyDownloader.m
//  DownloaderWithBlock
//
//  Created by gaokunpeng on 15/8/8.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyDownloader.h"

@interface MyDownloader ()<NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@end

@implementation MyDownloader
{
    //下载的数据
    NSMutableData *_receiveData;
    //下载
    NSURLConnection *_conn;
    
    //下载结束调用的代码块
    void (^_finishBlock)(NSData *);
    void (^_failBlock)(NSError *);
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _receiveData = [NSMutableData data];
    }
    return self;
}

-(void)downloadWithUrlString:(NSString *)urlString finish:(void (^)(NSData *))finishBlock fail:(void (^)(NSError *))failBlock
{
    
    if (_finishBlock != finishBlock) {
        _finishBlock = nil;
        _finishBlock = finishBlock;
    }
    
    if (_failBlock != failBlock) {
        _failBlock = nil;
        _failBlock = failBlock;
    }
    
    //NSURL
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    _conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
}

#pragma mark - NSURLConnection代理
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //下载失败
    _failBlock(error);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receiveData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //下载结束
    _finishBlock(_receiveData);
}

@end
