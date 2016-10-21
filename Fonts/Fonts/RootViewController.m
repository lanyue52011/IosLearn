//
//  RootViewController.m
//  Fonts
//
//  Created by 周登峰 on 7/17/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "RootViewController.h"
#import "FavoritesList.h"
#import "FontListViewController.h"

@interface RootViewController ()

@property(copy,nonatomic) NSArray *familyNames;
@property(assign,nonatomic) CGFloat cellPointsSize;
@property(strong,nonatomic) FavoritesList *favoritestLists;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.familyNames=[[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
    
    UIFont *firstFont=[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    self.cellPointsSize=firstFont.pointSize;
    
    self.favoritestLists=[FavoritesList shareFavoritesList];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  根据indexPath返回字体
 *
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
-(UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
    {
        NSString *familyName=self.familyNames[indexPath.row];
        NSString *fontName=[[UIFont fontNamesForFamilyName:familyName] firstObject];
        return [UIFont fontWithName:fontName size:self.cellPointsSize ];
    }else{
        return nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
   // return 0;
    if([self.favoritestLists.favorites count]>0)
    {
        return 2;
    }else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
  //  return 0;
    if(section==0)
    {
        return [self.familyNames count];
    }else{
        return 1;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0)
    {
        return @"All Font Famlies";
    }else{
        return @"My Favorite Fonts";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    static NSString *familyName=@"Family";
    static NSString *favoriteName=@"Favorite";
    UITableViewCell *cell = nil;//[tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    if(indexPath.section==0)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:familyName forIndexPath:indexPath];
        cell.textLabel.font=[self fontForDisplayAtIndexPath:indexPath];
        cell.textLabel.text=self.familyNames[indexPath.row];
        cell.detailTextLabel.text=self.familyNames[indexPath.row];
    }else{
        cell=[tableView dequeueReusableCellWithIdentifier:favoriteName forIndexPath:indexPath];
    }
    
    return cell;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPaht=[self.tableView indexPathForCell:sender];
    FontListViewController *listVc=segue.destinationViewController;
    if(indexPaht.section==0)
    {
        NSString *familyName=self.familyNames[indexPaht.row];
        listVc.fontNames=[[UIFont fontNamesForFamilyName:familyName]sortedArrayUsingSelector:@selector(compare:)];
        listVc.navigationItem.title=familyName;
        listVc.showFavorite=NO;
        
    }else{
        listVc.fontNames=self.favoritestLists.favorites;
        listVc.navigationItem.title=@"Favorites";
        listVc.showFavorite=YES;
        
    }
}


@end
