//
//  MasterViewController.h
//  Presidents
//
//  Created by 周登峰 on 7/20/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property(copy,nonatomic)NSArray *presidents;


- (void) loadListData;
@end

