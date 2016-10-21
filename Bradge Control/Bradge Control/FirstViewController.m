//
//  FirstViewController.m
//  Bradge Control
//
//  Created by 周登峰 on 7/27/16.
//  Copyright © 2016 cnpdc. All rights reserved.
//

#import "FirstViewController.h"
#import "Constants.h"

@interface FirstViewController ()
@property(weak,nonatomic) IBOutlet UILabel *officerLable;
@property(weak,nonatomic) IBOutlet UILabel *authorizationCodeLable;
@property(weak,nonatomic) IBOutlet UILabel *rankLable;
@property(weak,nonatomic) IBOutlet UILabel *warpLable;
@property(weak,nonatomic) IBOutlet UILabel *warpFactorLable;
@property(weak,nonatomic) IBOutlet UILabel *favoriteTeaLable;
@property(weak,nonatomic) IBOutlet UILabel *favoriteCaptainLable;
@property(weak,nonatomic) IBOutlet UILabel *favoriteGadgetLable;
@property(weak,nonatomic) IBOutlet UILabel *favoriteAlienLable;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshFields];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshFields{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.officerLable.text=[defaults objectForKey:kOfficerKey];
    self.authorizationCodeLable.text=[defaults objectForKey:kAuthorizationCodeKey];
    self.rankLable.text=[defaults objectForKey:kRankKey];
    self.warpLable.text=[defaults boolForKey:kWarpDriveKey]?@"Engaged":@"Disabled";
    self.warpFactorLable.text=[defaults objectForKey:kWarpFactorKey];
    self.favoriteTeaLable.text=[defaults objectForKey:kFavoriteTeaKey];
    self.favoriteCaptainLable.text=[defaults objectForKey:kFavoriteCaptainKey];
    self.favoriteGadgetLable.text=[defaults objectForKey:kFavoriteGadgetKey];
    self.favoriteAlienLable.text=[defaults objectForKey:kFavoriteAlienKey];
}
-(void)applicationWillEnterForeground:(NSNotification *)notification{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}
/**
 *  消息提醒通知中心注册消息
 *
 *  @param animated <#animated description#>
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshFields];
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillTerminateNotification object:app];
}
/**
 *  取消消息注册
 *
 *  @param animated <#animated description#>
 */
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
