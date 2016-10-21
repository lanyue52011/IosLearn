//
//  ViewController.m
//  layouttest
//
//  Created by 周登峰 on 8/31/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "SBJson4.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AFHTTPSessionManager * manger=[AFHTTPSessionManager manager];
       manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:@"" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
