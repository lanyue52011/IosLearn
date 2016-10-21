//
//  DetailViewController.h
//  Presidents
//
//  Created by 周登峰 on 7/20/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property(weak,nonatomic) IBOutlet UIWebView *webview;

@property(strong,nonatomic) WKWebView *wkwebView;
@property(strong,nonatomic) UIBarButtonItem *languageButton;
@property(strong,nonatomic) UIPopoverController *languagePogoverController;
@property(copy,nonatomic) NSString *languageString;

@end

