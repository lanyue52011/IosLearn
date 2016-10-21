//
//  Tools.m
//  fqnp
//
//  Created by 周登峰 on 7/27/16.
//  Copyright © 2016 cnpdc. All rights reserved.
//

#import "Tools.h"
#if TARGET_IPHONE_SIMULATOR//模拟器
const static NSString *baseUrl=@"http://192.168.1.103:9999";
#elif TARGET_OS_IPHONE//真机
const static NSString *baseUrl=@"http://10.17.254.13:9999";
#endif


@implementation Tools

+(NSString *)getBaseUrl{
    
    
    return baseUrl;
}
/**
 *  根据url获取json数据
 *
 *  @param path <#path description#>
 *
 *  @return <#return value description#>
 */
+(NSArray *)getJsonByUrl:(NSString *)path{
    NSString *urlStr=[[baseUrl stringByAppendingString:path ] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSArray *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
    return dict;
}
+(NSString *)getStringByUrl:(NSString *)path{
    NSString *urlStr=[[baseUrl stringByAppendingString:path ] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
   // NSArray *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
    //return dict;
}

/**
 *  图片缩放
 *
 *  @param image     <#image description#>
 *  @param scaleSize <#scaleSize description#>
 *
 *  @return <#return value description#>
 */

+(UIImage *)reSizeImage:(UIImage *)image toScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.height*scaleSize,image.size.width*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.height*scaleSize, image.size.width*scaleSize)];
    UIImage *scaleImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaleImage;
    
}

+(UIImage *)reSizeImage:(UIImage *)image  toSize:(CGSize)size{
    UIGraphicsBeginImageContext(CGSizeMake(size.height , size.width));
    [image drawInRect:CGRectMake(0, 0, size.height , size.width)];
    UIImage *toImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return toImage;
    
}

+(NSString *) stringToDateTIme:(NSString *)dateStr{
    NSRange range=NSMakeRange(6, 10);
    NSString *s=  [dateStr substringWithRange:range];
    NSInteger num=[s integerValue];
    
    NSDateFormatter *fromatter=[[NSDateFormatter alloc]init];
    [fromatter setDateStyle:NSDateFormatterMediumStyle];
    [fromatter setTimeStyle:NSDateFormatterLongStyle];
    [fromatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *confromT=[NSDate dateWithTimeIntervalSince1970:num];
    NSString *timeStr=[fromatter stringFromDate:confromT];
    return timeStr;
    
}
+(NSString *)submitByGet:(NSString *)path{
    NSString *urlStr=[[baseUrl stringByAppendingString:path ]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    NSURL *url=[NSURL URLWithString:urlStr] ;
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
+(void)saveLoginInfo:(NSString *)userCode loginState:(NSString *)loginState{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:userCode forKey:@"userCode"];
    [defaults setObject:loginState forKey:@"loginState"];
    [defaults synchronize];
}

+(NSString *)getLoginByCode:(NSString *)code{
      NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:code];
}

@end
