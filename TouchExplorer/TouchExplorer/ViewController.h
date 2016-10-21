//
//  ViewController.h
//  TouchExplorer
//
//  Created by 周登峰 on 8/15/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)btnTip:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *textMessage;
@property (weak, nonatomic) IBOutlet UILabel *labelTaps;
@property (weak, nonatomic) IBOutlet UILabel *labelTouch;
@property(nonatomic) CGPoint StartPoint;

@end

