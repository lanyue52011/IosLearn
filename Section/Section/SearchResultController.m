//
//  SearchResultController.m
//  Section
//
//  Created by 周登峰 on 7/16/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "SearchResultController.h"

static NSString *sectionTableId=@"SectionsTableIdentifier";
@interface SearchResultController ()
@property(strong,nonatomic) NSDictionary *names;
@property(strong,nonatomic) NSArray *keys;
@property(strong,nonatomic) NSMutableArray *filterName;
@end

@implementation SearchResultController

static const NSUInteger longNameSize=6;
static const NSInteger shortNameButtonIndex=1;
static const NSInteger longNameButtonIndex=2;
/**
 *  扩展接口方法，用于赋值和初始化
 *
 *  @param names <#names description#>
 *  @param keys  <#keys description#>
 *
 *  @return <#return value description#>
 */
-(instancetype)initWithNames:(NSDictionary *)names keys:(NSArray *)keys{
    if(self==[super initWithStyle:UITableViewStylePlain]){
        self.names=names;
        self.keys=keys;
        self.filterName=[[NSMutableArray alloc] init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:sectionTableId];
}

-(void)updateSearchResultsForSearchController:(UISearchController *)controller{
    
    NSString *searchText=controller.searchBar.text;
    NSInteger buttonIndex=controller.searchBar.selectedScopeButtonIndex;
    
    [self.filterName removeAllObjects];
     //[self.filterName  removeAllObjects];
    if(searchText.length>0)
    {
       
        
        NSPredicate *predicate=
        [NSPredicate predicateWithBlock:^BOOL(NSString *name,NSDictionary *b){
            NSUInteger nameLength=name.length;
            if((buttonIndex==shortNameButtonIndex && nameLength>=longNameSize)
               ||(buttonIndex==longNameButtonIndex&& nameLength<longNameSize))
            {
                return NO;
            }
            NSRange range=[name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            return range.location!=NSNotFound;
        }];
        
        for (NSString *key in self.keys) {
            NSArray *matchs=[self.names[key] filteredArrayUsingPredicate:predicate];
            [self.filterName addObjectsFromArray:matchs];
           }
        
    }
    [self.tableView reloadData];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:sectionTableId];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
////#warning Incomplete implementation, return the number of sections
//    return [self.filterName count];
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.filterName count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:sectionTableId forIndexPath:indexPath];
    cell.textLabel.text=self.filterName[indexPath.row];
    return  cell;
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
