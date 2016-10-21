//
//  LanguageListController.h
//  Presidents
//
//  Created by 周登峰 on 7/21/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;
@interface LanguageListController : UITableViewController

@property(weak,nonatomic) DetailViewController *detailViewControl;
@property(copy,nonatomic) NSArray *languageNames;
@property(copy,nonatomic) NSArray *languageCodes;
@end
