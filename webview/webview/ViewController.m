//
//  ViewController.m
//  webview
//
//  Created by 周登峰 on 7/31/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFHTTPSessionManager.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(strong,nonatomic) CLLocationManager *locationManage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    //[locationManage startUpdatingLocation];
    //[locationManage location]
    
    
//       NSString *urlStr = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";    
//    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
//     manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
//    //manger.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSMutableDictionary *param=[[NSMutableDictionary alloc]init];
//   // [param setValue:@"aapl-c.json" forKey:@"filename"];
//    param[@"filename"]=@"aapl-c.json";
//    
//    [manger GET:@"https://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json" parameters:nil progress:nil success:^(NSURLSessionDataTask *  task, id   responseObject) {
//        NSString *res=responseObject;
//        self.contentLable.text=res;
//        //<#code#>
//    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
//        //
//        //NSString *res=error;
//        self.contentLable.text=@"网络连接失败";
//        
//    }];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
   // NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
   // [center addObserver:self selector:@selector(log:) name:@"print" object:nil];
    //[center addObserver:self selector:@selector(didReceiveMemoryWarning) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
   // locations.
    CLLocation *l=locations[[locations count]-1];
    //l.coordinate.latitude
    self.textview.text=[NSString stringWithFormat:@"latitude:%lf  longitude:%lf",l.coordinate.latitude,l.coordinate.longitude];
   // [manager stopUpdatingHeading];

}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
            case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManage startUpdatingLocation];
            break;
            
        default:
            [self.locationManage stopUpdatingHeading];
            break;
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    self.textview.text=@"location fail";
}

-(IBAction)run:(id)sender{
    self.locationManage=[[CLLocationManager alloc] init];
    self.locationManage.delegate=self;
    self.locationManage.desiredAccuracy=kCLLocationAccuracyBest;
    self.locationManage.distanceFilter=kCLDistanceFilterNone;
    [self.locationManage requestWhenInUseAuthorization];
//    [self.activityIndicator startAnimating];
//    dispatch_queue_t quenu=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(quenu, ^{
//     NSString *res= [self dowork];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.textview.text=res;
//            [self.activityIndicator stopAnimating];
//        });
//    });
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)dowork{
    [NSThread sleepForTimeInterval:10];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"print" object:nil userInfo:[NSDictionary   dictionaryWithObject:@"lanyue" forKey:@"name"]];
    return @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
}

-(void)log:(id)sender{
    NSLog(@"%@" ,[[sender userInfo] objectForKey:@"name"]);
}

- (IBAction)btnTip:(id)sender {
}
@end
