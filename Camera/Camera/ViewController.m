//
//  ViewController.m
//  Camera
//
//  Created by 周登峰 on 8/3/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "LayoutAutoDictionary.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *takePictureButton;

@property(strong,nonatomic) MPMoviePlayerController *movePlayerController;

@property(strong,nonatomic) UIImage *image;

@property(strong,nonatomic) NSURL *moveUrl;

@property(copy,nonatomic) NSString *lastChosenMediaType;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.takePictureButton.hidden=YES;
    }
    LayoutAutoDictionary *dict=[LayoutAutoDictionary new];
    dict.string=@"lanyue";
    
    NSLog(@"dict.string=:%@",dict.string);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateDisplay{
    if([self.lastChosenMediaType isEqual:(NSString *)kUTTypeImage]){
        self.imageView.image=self.image;
        self.imageView.hidden=NO;
        self.movePlayerController.view.hidden=YES;
    }else if([self.lastChosenMediaType isEqual:(NSString *)kUTTypeMovie]){
        if(self.movePlayerController==nil){
            self.movePlayerController=[[MPMoviePlayerController alloc] initWithContentURL:self.moveUrl];
            UIView *moveView=self.movePlayerController.view;
            moveView.frame=self.imageView.frame;
            moveView.clipsToBounds=YES;
            [self.view addSubview:moveView];
            [self setMovePlayerLayoutConstraints];
        }else{
        self.movePlayerController.contentURL=self.moveUrl;
        }
        self.imageView.hidden =YES;
        self.movePlayerController.view.hidden=NO;
        [self.movePlayerController play];
    }
   
}


-(void)setMovePlayerLayoutConstraints{
    UIView *moviePlayerView=self.movePlayerController.view;
    UIView *takePictureButton=self.takePictureButton;
    moviePlayerView.translatesAutoresizingMaskIntoConstraints=NO;
    NSDictionary *views=NSDictionaryOfVariableBindings(moviePlayerView,takePictureButton);
//    [self.view addConstraint:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moviePlayerView]|" options:0 metrics:nil views:views]];
//    [self.view addConstraint:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[moviePlayerView]-0-[takePictureButton]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moviePlayerView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[moviePlayerView]-0-[takePictureButton]" options:0 metrics:nil views:views]];

    
}

-(void)pickMediaForSource:(UIImagePickerControllerSourceType)sourceType{
    NSArray *mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:sourceType];
    if([UIImagePickerController isSourceTypeAvailable:sourceType]&& [mediaTypes count] > 0){
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.mediaTypes=mediaTypes;
        picker.delegate=self;
        picker.allowsEditing=YES;
        picker.videoQuality=UIImagePickerControllerQualityTypeLow;//相片质量
        picker.sourceType=sourceType;
        [self presentViewController:picker animated:YES completion:NULL];
    }else{
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"error accessing media" message:@"unsupported media source." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateDisplay];
}

-(IBAction)shootPictureOrVideo:(id)sender{
    [self pickMediaForSource:UIImagePickerControllerSourceTypeCamera];
}
-(IBAction)selectExitPicture:(id)sender{
    [self pickMediaForSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.lastChosenMediaType=info[UIImagePickerControllerMediaType];
    if([self.lastChosenMediaType isEqual:(NSString *)kUTTypeImage]){
        self.image=info[UIImagePickerControllerOriginalImage];
    }else if([self.lastChosenMediaType isEqual:(NSString *)kUTTypeMovie]){
        self.moveUrl=info[UIImagePickerControllerMediaURL];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnTipAction:(id)sender {
}
@end
