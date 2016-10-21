//
//  ViewController.m
//  Persistence
//
//  Created by 周登峰 on 7/31/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取docm目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPaht=paths[0];
    
   // NSArray *tempsPath=NSSearchPathForDirectoriesInDomains(NSTemporaryDirectory(), <#NSSearchPathDomainMask domainMask#>, <#BOOL expandTilde#>)
    NSString *tempPaht=NSTemporaryDirectory();
    NSDictionary *tempDict=[[NSDictionary alloc] init];
    [tempDict writeToFile:tempPaht atomically:YES];
}
- (IBAction)run:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
