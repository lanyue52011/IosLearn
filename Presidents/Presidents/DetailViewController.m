//
//  DetailViewController.m
//  Presidents
//
//  Created by 周登峰 on 7/20/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "DetailViewController.h"
#import "LanguageListController.h"

@interface DetailViewController ()<UIPopoverControllerDelegate>

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
        
    }
}

static NSString * modifyUrlLanguage(NSString *url,NSString *lang){
    
    if(!lang){
        return url;
    }
    
    NSRange codeRange=NSMakeRange(7, 2);
    if([[url substringWithRange:codeRange] isEqualToString:lang]){
        return url;
    }else{
        NSString *newUrl=[url stringByReplacingCharactersInRange:codeRange withString:lang];
        return  newUrl;
    }
   //return @"";
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        NSDictionary *dict=(NSDictionary *)self.detailItem;
        NSString *path=modifyUrlLanguage(dict[@"url"], self.languageString) ;
        
       self.detailDescriptionLabel.text=path;
        
        NSURL *url=[NSURL URLWithString:path];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        [self.wkwebView loadRequest:request];
        self.title=dict[@"name"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.wkwebView=[[WKWebView alloc] initWithFrame:self.view.bounds];
    //[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self.view addSubview:_wkwebView];
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad){
        self.languageButton=[[UIBarButtonItem alloc]initWithTitle:@"Choose Language" style:UIBarButtonItemStylePlain target:self action:@selector(toggleLangragePopover)];
        self.navigationItem.rightBarButtonItem=self.languageButton;
    }
    //[self.view ad];
    [self configureView];
}
/**
 *  <#Description#>
 *
 *  @param newString <#newString description#>
 */
-(void)setLanguageString:(NSString *)newString{
    if(![newString isEqualToString:self.languageString]){
        _languageString=[newString copy];
        [self configureView];
    }
    if(self.languagePogoverController!=nil){
        [self.languagePogoverController dismissPopoverAnimated:YES];
        self.languagePogoverController=nil;
    }
}
/**
 *  触发浮动窗口
 */
-(void)toggleLangragePopover{
    if(self.languagePogoverController==nil){
        LanguageListController *languageListController=[[LanguageListController alloc] init];
        languageListController.detailViewControl=self;
        UIPopoverController *poc=[[UIPopoverController alloc] initWithContentViewController:languageListController];
        [poc presentPopoverFromBarButtonItem:self.languageButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        self.languagePogoverController=poc;
    }else{
        [self.languagePogoverController dismissPopoverAnimated:YES];
        self.languagePogoverController=nil;
    }
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
  
    if(popoverController==self.languagePogoverController){
        self.languagePogoverController=nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
