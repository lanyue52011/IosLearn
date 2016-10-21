//
//  ViewController.m
//  NSGradViewTest
//
//  Created by 周登峰 on 10/14/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
//#import "NSObject+Tips.h"
#import "MBProgressHUD.h"
#import "NSObject+Tips.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   //NSClassFromString
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnTip:(id)sender{
 
    [self showFailureTips:@"btn tishi"];
}

@end
