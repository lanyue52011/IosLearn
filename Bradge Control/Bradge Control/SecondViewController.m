//
//  SecondViewController.m
//  Bradge Control
//
//  Created by 周登峰 on 7/27/16.
//  Copyright © 2016 cnpdc. All rights reserved.
//


#import "SecondViewController.h"
#import "Constants.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)refreshFields{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)applicationWillEnterForeground:(NSNotification *)notification{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}

@end
