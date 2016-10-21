//
//  SearchResultController.h
//  Section
//
//  Created by 周登峰 on 7/16/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultController : UITableViewController<UISearchResultsUpdating>
-(instancetype)initWithNames:(NSDictionary *)names keys:(NSArray *)keys;
@end
