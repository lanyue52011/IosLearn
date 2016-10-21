//
//  ViewController.m
//  Section
//
//  Created by 周登峰 on 7/16/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
#import "SearchResultController.h"

static NSString *sectionTableId=@"SectionsTableIdentifier";
@interface ViewController ()
@property(copy,nonatomic) NSDictionary *dictData;
@property(copy,nonatomic) NSArray *keys;
@property(weak,nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) UISearchController *searchController;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:sectionTableId];

//    dispatch_once_t once;
//   dispatch_async(once, ^{
//       [self tableviewLoadData];
//   });
    
   // dispatch_once_t once;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self tableviewLoadData];
    });
    
   
    //实例search控件
    SearchResultController *resultController=[[SearchResultController alloc] initWithNames:self.dictData keys:self.keys];
   
    
    self.searchController=[[UISearchController alloc] initWithSearchResultsController:resultController];
    UISearchBar *searchBar=self.searchController.searchBar;
    searchBar.scopeButtonTitles=@[@"All",@"Short",@"Long"];
    searchBar.placeholder=@"enter a search name";
    [searchBar sizeToFit];
    //设置tableview表头为搜索控件
    self.tableView.tableHeaderView=searchBar;
    self.searchController.searchResultsUpdater=resultController;
    
   // self.tableView.sectionIndexBackgroundColor=[UIColor blackColor];
   // self.tableView.sectionIndexTrackingBackgroundColor=[UIColor darkGrayColor];
  //  self.tableView.sectionIndexColor=[UIColor whiteColor];
    self.tableView.sectionIndexBackgroundColor=[UIColor whiteColor];
    self.tableView.sectionIndexColor=[UIColor blueColor];
}
- (void) tableviewLoadData{
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    self.dictData=[NSDictionary dictionaryWithContentsOfFile:path];
    self.keys=[[self.dictData allKeys] sortedArrayUsingSelector:@selector(compare:)] ;
    
     dispatch_async(dispatch_get_main_queue(), ^{
         [self.tableView reloadData];
     });
}


- (IBAction)qq:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  设置section 数量
 *
 *  @param tableView <#tableView description#>
 *
 *  @return <#return value description#>
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.keys count];
}
/**
 *  设置section 数据数量
 *
 *  @param tableView <#tableView description#>
 *  @param section   <#section description#>
 *
 *  @return <#return value description#>
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key=self.keys[section];
    NSArray *selectionData=self.dictData[key];
    return [selectionData count];
}
/**
 *  设置section 显示内容
 *
 *  @param tableView <#tableView description#>
 *  @param section   <#section description#>
 *
 *  @return <#return value description#>
 */
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.keys[section];
}


/**
 *  设置表格显示内容
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:sectionTableId forIndexPath:indexPath];
    NSString *key=self.keys[indexPath.section];
    NSArray *selectionData=self.dictData[key];
    cell.textLabel.text=selectionData[indexPath.row];
    return cell;
}
/**
 *  添加分区索引
 *
 *  @param tableView <#tableView description#>
 *
 *  @return <#return value description#>
 */
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.keys;
}
//-index
//-section

- (IBAction)startRun:(UIButton *)sender {
}
@end
