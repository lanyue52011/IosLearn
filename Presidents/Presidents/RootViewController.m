//
//  RootViewController.m
//  Presidents
//
//  Created by 周登峰 on 7/21/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    UIViewController *spv=self.viewControllers[0];
    UITraitCollection *newTrait=self.traitCollection;
    if(newTrait.horizontalSizeClass==UIUserInterfaceSizeClassCompact&&newTrait.verticalSizeClass==UIUserInterfaceSizeClassCompact){
        UITraitCollection *chirTra=[UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassRegular];
        [self setOverrideTraitCollection:chirTra forChildViewController:spv];
        
    }else{
        [self setOverrideTraitCollection:nil forChildViewController:spv];
    }
    [super traitCollectionDidChange:previousTraitCollection];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
