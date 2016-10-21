//
//  FontInfoViewController.m
//  Fonts
//
//  Created by 周登峰 on 7/18/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "FontInfoViewController.h"
#import "FavoritesList.h"

@interface FontInfoViewController ()
@property(weak,nonatomic) IBOutlet UILabel *fontSampleLable;
@property(weak,nonatomic) IBOutlet UISlider *fontSizeSlider;
@property(weak,nonatomic) IBOutlet UILabel *fontSizeLable;
@property(weak,nonatomic) IBOutlet UISwitch *favoriteSwitch;

@end

@implementation FontInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fontSampleLable.font=self.font;
    self.fontSampleLable.text=@"QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
    
    self.fontSizeSlider.value=self.font.pointSize;
    self.fontSizeLable.text=[NSString stringWithFormat:@"%.0f",self.font.pointSize];
    self.favoriteSwitch.on=self.favorite;
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fontSlider:(UISlider *)sender {
    float newSize=roundf(sender.value);
    self.fontSampleLable.font=[self.font fontWithSize:newSize];
    self.fontSizeLable.text=[NSString stringWithFormat:@"%.0f",newSize];
}
- (IBAction)fontFavorite:(UISwitch *)sender {
    FavoritesList *favoritesList=[FavoritesList shareFavoritesList];
    if(sender.on){
        [favoritesList addFavorite:self.font.fontName];
    }else{
        [favoritesList removeFavorite:self.font.fontName];
    }
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
