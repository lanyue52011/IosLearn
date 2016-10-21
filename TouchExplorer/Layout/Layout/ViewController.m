//
//  ViewController.m
//  Layout
//
//  Created by 周登峰 on 8/23/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
#import "LayoutAutoDictionary.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // UIStackView *stackview=[[UIStackView alloc] init];
    //stackview
        //self.stackView.
    // Do any additional setup after loading the view, typically from a nib.
    CGPoint lp=  self.label.center;
    CGRect cr= self.label.frame;
   CGRect lbr= self.label.bounds;
    
    NSLog(@"label center is x:%.f y:%.f  CGRect x:%.f y:%.f height %.f width:%.fbounds:x:%.f y:%.f height %.f width:%.f",lp.x,lp.y,cr.origin.x,cr.origin.y,cr.size.height,cr.size.width,lbr.origin.x ,lbr.origin.y,lbr.size.height,lbr.size.width);
    
    LayoutAutoDictionary *dict=[LayoutAutoDictionary new];
    dict.string=@"lanyue";
    
    NSLog(@"dict.string=:%@",dict.string);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //self.stackView.
    // Dispose of any resources that can be recreated.
}




- (IBAction)sssss:(id)sender {
}
@end
