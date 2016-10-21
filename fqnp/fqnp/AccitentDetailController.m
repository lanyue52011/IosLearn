//
//  AccitentDetailController.m
//  fqnp
//
//  Created by 周登峰 on 8/3/16.
//  Copyright © 2016 cnpdc. All rights reserved.
//

#import "AccitentDetailController.h"
#import "AFHTTPSessionManager.h"
#import "AccidentController.h"
#import "Tools.h"

@interface AccitentDetailController ()

@end

@implementation AccitentDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"新增事故";
    UIImage *im=[UIImage imageNamed:@"accident.png"];
    [self uploadImageWithImage:im];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
    // Dispose of any resources that can be recreated.
}

//#pragma mark - 上传图片
- (void)uploadImageWithImage:(UIImage *)image {
    //截取图片
    
    
   // NSData *imageData = UIImageJPEGRepresentation(image, 0.001);
    NSData *imageData= UIImagePNGRepresentation(image);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    // 参数
    NSMutableDictionary *param=[[NSMutableDictionary alloc] init];
     param[@"name"]=@"应急演习_Ⅲ级预警,福清核电于2016年06月14日16时宣布进入Ⅲ级预警";
     param[@"content"]=@"台风苏迪距离福清50.9668M，中心风力13级，七级风圈半径280KM，十级风圈半径0KM，移动速度33KM/时";
     param[@"level"]=@"U";
     param[@"currenttime"]=@"2016-08-05";
     param[@"loginstate"]=[Tools getLoginByCode:@"loginState"];
    
    // 访问路径
    //NSString *stringURL =
    NSString *fullUrl=[[Tools getBaseUrl] stringByAppendingString:@"/mobile/apisaveaccident"];
    
    [manager POST:fullUrl parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 上传文件
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat            = @"yyyyMMddHHmmss";
        NSString *str                         = [formatter stringFromDate:[NSDate date]];
        NSString *fileName               = [NSString stringWithFormat:@"%@.png", str];
        
        [formData appendPartWithFileData:imageData name:@"photos" fileName:fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *err;
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&err];
        
        NSString *res=[dict objectForKey:@"result"];
        
        //提示操作
        NSString *message=@"保存失败";
        if([res isEqualToString:@"ok"]){
            message=@"保存成功";
        }
       // [self.inventory  refreshTableView];
        
        //保存提示
        UIAlertController *alertContorl=[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        
        [NSTimer scheduledTimerWithTimeInterval:1.0f
                                         target:self
                                       selector:@selector(timerFireMethod:)
                                       userInfo:alertContorl
                                        repeats:YES];
        [self presentViewController:alertContorl animated:YES completion:nil];
        // DLog(@"上传陈宫");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //DLog(@"上传失败")
    }];
}

-(void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertController *promptAlert = (UIAlertController*)[theTimer userInfo];
    [promptAlert dismissViewControllerAnimated:true completion:nil];
}

@end
