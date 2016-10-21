//
//  InventoryDetail1Controller.m
//  fqnp
//
//  Created by 周登峰 on 8/3/16.
//  Copyright © 2016 cnpdc. All rights reserved.
//

#import "InventoryDetailController.h"
#import "AFHTTPSessionManager.h"
#import "Tools.h"
#import "InventoryController.h"

@interface InventoryDetailController ()

@end

@implementation InventoryDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textArrive.text=[NSString stringWithFormat:@"%@",[self.gather valueForKey:@"Arrive"]];
    self.textAbsent.text=[NSString stringWithFormat:@"%@",[self.gather valueForKey:@"Absent"]];
    self.textOffset.text=[NSString stringWithFormat:@"%@",[self.gather valueForKey:@"Offset"]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnSave:(UIButton *)sender {
    NSMutableDictionary *temp=[self.gather mutableCopy];
    
    [temp setValue: self.textArrive.text forKey:@"Arrive"];
    [temp setValue:self.textAbsent.text forKey:@"Absent"];
    [temp setValue:self.textOffset.text forKey:@"Offset"];
    self.gather=temp;
    [self save];
}


-(void)save
{
   // [self hide];
    NSMutableDictionary *param=[[NSMutableDictionary alloc] init];
    param[@"name"]=[self.gather valueForKey:@"Name"];
    param[@"total"]=[self.gather valueForKey:@"Total"];
    param[@"arrive"]=[self.gather valueForKey:@"Arrive"];
    param[@"offset"]=[self.gather valueForKey:@"Offset"];
    param[@"absent"]=[self.gather valueForKey:@"Absent"];
    param[@"loginstate"]=[Tools getLoginByCode:@"loginState"];
    
    
    NSString *fullUrl=[[Tools getBaseUrl] stringByAppendingString:@"/mobile/apisavegather"];
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [manger GET:fullUrl parameters:param progress:nil success:^(NSURLSessionDataTask *  task, id  responseObject) {
        NSError *err;
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&err];
        
        NSString *res=[dict objectForKey:@"result"];
        
        //提示操作
        NSString *message=@"保存失败";
        if([res isEqualToString:@"ok"]){
            message=@"保存成功";
        }
        [self.inventory  refreshTableView];
        
        //保存提示
        UIAlertController *alertContorl=[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        
        [NSTimer scheduledTimerWithTimeInterval:1.0f
                                         target:self
                                       selector:@selector(timerFireMethod:)
                                       userInfo:alertContorl
                                        repeats:YES];
        [self presentViewController:alertContorl animated:YES completion:nil];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"网络异常");
    }];
    
}

-(void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertController *promptAlert = (UIAlertController*)[theTimer userInfo];
    [promptAlert dismissViewControllerAnimated:true completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.textOffset resignFirstResponder];
    [self.textAbsent resignFirstResponder];
    [self.textArrive resignFirstResponder];
}

@end
