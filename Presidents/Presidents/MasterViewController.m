//
//  MasterViewController.m
//  Presidents
//
//  Created by 周登峰 on 7/20/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    
    
   // UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
   
    dispatch_once_t once;
    dispatch_async(once, ^{
        [self loadListData];
    })
    
    NSIndexPath *indexPaht=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPaht animated:true scrollPosition:UITableViewScrollPositionMiddle];
   // UIStoryboardSegue *s=[UIStoryboardSegue segueWithIdentifier:@"showDetail" source:self destination:_detailViewController performHandler:^{}];
 
  
    //[self prepareForSegue:s sender:[self.tableView cellForRowAtIndexPath:indexPaht]];

}
-（void)loadListData(){
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"PresidentList" ofType:@"plist"];
    NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:path];
    self.presidents=[dict objectForKey:@"presidents"];
    //dispatch_once_t
    dispatch_sync(dispatch_get_main_queue(), ^{
     //
     [self.tableView reloadData];
 });
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = self.presidents[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
       // [controller setDetailItem:object];
        controller.languageString=self.detailViewController.languageString;
        self.detailViewController=controller;
        controller.detailItem=object;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presidents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *object = self.presidents[indexPath.row];
    cell.textLabel.text = object[@"name"];
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

@end
