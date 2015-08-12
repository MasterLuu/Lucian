//
//  ViewController.m
//  DownloaderWithBlock
//
//  Created by gaokunpeng on 15/8/8.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "MyDownloader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //下载数据
    //http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1
    
    MyDownloader *downloader = [[MyDownloader alloc] init];
    [downloader downloadWithUrlString:@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1" finish:^(NSData *data) {
        
        //JSON解析
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",result);
        
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
