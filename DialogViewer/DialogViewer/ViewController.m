//
//  ViewController.m
//  DialogViewer
//
//  Created by 周登峰 on 7/19/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
#import "HeaderCell.h"
#import "ContentCell.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout>
- (IBAction)shootPictureOrVideo:(UIButton *)sender;
- (IBAction)start:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sections=@[
                    @{@"header":@"First Witch",
                      @"content":@"Do any additional setup after loading the view, typically from a nib."},
                    @{@"header":@"Second Witch",
                      @"content":@"Copyright 2016 tab All rights reserved."},
                    @{@"header":@"Third Witch",
                      @"content":@"Do any additional setup after loading the view typically from a nib."},
                    @{@"header":@"First Witch",
                      @"content":@"Do any additional setup after loading the view, typically from a nib."},
                    @{@"header":@"Second Witch",
                      @"content":@"Copyright 2016 tab. All rights reserved."},
                    @{@"header":@"Third Witch",
                      @"content":@"Do any additional setup after loading the view, typically from a nib."}
                    
                    ];
    [self.collectionView registerClass:[ContentCell class] forCellWithReuseIdentifier:@"Content"];
    [self.collectionView registerClass:[HeaderCell class] forCellWithReuseIdentifier:@"Header"];
    
    UIEdgeInsets contentInset=self.collectionView.contentInset;
    contentInset.top=20;
    [self.collectionView setContentInset:contentInset];
    
    UICollectionViewLayout *layout=self.collectionView.collectionViewLayout;
    UICollectionViewFlowLayout *flow=(UICollectionViewFlowLayout *)layout;
    flow.sectionInset=UIEdgeInsetsMake(10, 20, 30, 20);
    flow.headerReferenceSize=CGSizeMake(100, 25);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)dsf:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray *)wordInSection:(NSInteger)section{
    NSString *content=self.sections[section][@"content"];
    NSCharacterSet *space=[NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *word=[content componentsSeparatedByCharactersInSet:space];
    return word;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.sections count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *word=[self wordInSection:section];
    return [word count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath  {
    NSArray   *word=[self wordInSection:indexPath.section];
    ContentCell *cell=[self.collectionView  dequeueReusableCellWithReuseIdentifier:@"Content" forIndexPath:indexPath];
    cell.maxWidth=collectionView.bounds.size.width;
    //[cell setText:word[indexPath.row]];
    cell.text=word[indexPath.row];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *word=[self wordInSection:indexPath.section];
    CGSize size=[ContentCell sizeForContentString:word[indexPath.row] forMaxWidth:collectionView.bounds.size.width];
    return size;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqual:UICollectionElementKindSectionHeader]){
        HeaderCell *cell=[self.collectionView dequeueReusableCellWithReuseIdentifier:@"Header" forIndexPath:indexPath];
        cell.maxWidth=collectionView.bounds.size.width;
        cell.text=self.sections[indexPath.section][@"header"];
        return cell;
        
    }
    return nil;
}

- (IBAction)shootPictureOrVideo:(UIButton *)sender {
}

- (IBAction)start:(UIButton *)sender {
}
@end
