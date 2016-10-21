//
//  FontSizeViewController.m
//  Fonts
//
//  Created by 周登峰 on 7/17/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "FontSizeViewController.h"

@interface FontSizeViewController ()

@property(strong,nonatomic) NSArray *pointSize;

@end

@implementation FontSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pointSize=[self pointSize];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0; 
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self pointSize] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *familyName=@"fontNameAndSize";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:familyName forIndexPath:indexPath];
    cell.textLabel.font=[self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text=self.font.fontName;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@ Point",self.pointSize[indexPath.row]];
    
    
    return cell;
}

-(UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath{
    
    NSNumber *pointSize=self.pointSize[indexPath.row];

       return [self.font  fontWithSize:pointSize.floatValue];
  
}

-(NSArray *)pointSize{
    static NSArray *pointSize=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        pointSize=@[@"9",
                    @"10",
                    @"11",
                    @"12",
                    @"13",
                    @"14",
                    @"18",
                    @"24",
                    @"36",
                    @"48",
                    @"64",
                    @"72",
                    @"96",
                    @"144" ];
    });
    return pointSize;
}

@end
