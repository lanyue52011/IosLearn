//
//  FontListViewController.m
//  Fonts
//
//  Created by 周登峰 on 7/17/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "FontListViewController.h"
#import "FavoritesList.h"
#import "FontSizeViewController.h"
#import "FontInfoViewController.h"

@interface FontListViewController ()


@property(assign,nonatomic) CGFloat cellPointSize;

@end

@implementation FontListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFont *firstFont=[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    self.cellPointSize=firstFont.pointSize;
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
     self.tableView.estimatedRowHeight = 44.0;
    if(self.showFavorite){
        self.navigationItem.rightBarButtonItem=self.editButtonItem;
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
    {
        NSString *familyName=self.fontNames[indexPath.row];
        NSString *fontName=[[UIFont fontNamesForFamilyName:familyName] firstObject];
        return [UIFont fontWithName:fontName size:self.cellPointSize];
    }else{
        return nil;
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(self.showFavorite){
        self.fontNames=[FavoritesList shareFavoritesList].favorites;
        [self.tableView reloadData];
    }
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.fontNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *familyName=@"fontName";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:familyName forIndexPath:indexPath];
    cell.textLabel.font=[self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text=self.fontNames[indexPath.row];
    cell.detailTextLabel.text=self.fontNames[indexPath.row];
    
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPaht=[self.tableView indexPathForCell:sender];
    
    UIFont *font=[self fontForDisplayAtIndexPath:indexPaht];
    
    [segue.destinationViewController navigationItem].title=font.fontName;
    
    if([segue.identifier isEqualToString:@"showFontSize"]){
        FontSizeViewController *listVc=segue.destinationViewController;
        listVc.font=font;
    } else if([segue.identifier isEqualToString:@"showFontInfo"]){
        FontInfoViewController *fontInfoVc=segue.destinationViewController;
        fontInfoVc.font=font;
        fontInfoVc.favorite=[[FavoritesList shareFavoritesList].favorites containsObject:font.fontName];
    }
    
 
   
}

/**
 *  设置能否编辑单元格
 *
 *  @param BOOL <#BOOL description#>
 *
 *  @return <#return value description#>
 */
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    //return YES;
    return self.showFavorite;
}

/**
 *  删除操作
 *
 *  @return <#return value description#>
 */

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!self.showFavorite) return;
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSString *favorite=self.fontNames[indexPath.row];
        [[FavoritesList shareFavoritesList] removeFavorite:favorite];
        self.fontNames=[FavoritesList shareFavoritesList].favorites;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    //else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //}
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    [[FavoritesList shareFavoritesList] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    self.fontNames=[FavoritesList shareFavoritesList].favorites;
}

@end
