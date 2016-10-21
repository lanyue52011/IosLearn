//
//  ViewController.h
//  DialogViewer
//
//  Created by 周登峰 on 7/19/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UICollectionViewController

- (IBAction)startRun:(UIButton *)sender;
@property(copy,nonatomic) NSArray *sections;

@end

