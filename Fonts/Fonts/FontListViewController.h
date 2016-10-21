//
//  FontListViewController.h
//  Fonts
//
//  Created by 周登峰 on 7/17/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListViewController : UITableViewController
@property(copy,nonatomic) NSArray *fontNames;
@property(assign,nonatomic) BOOL showFavorite;
@end
