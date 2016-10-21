//
//  LayoutAutoDictionary.h
//  Layout
//
//  Created by 周登峰 on 9/5/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LayoutAutoDictionary : NSObject
@property (nonatomic,strong) NSString *string;

@property(nonatomic,strong) NSNumber *number;

@property(nonatomic,strong) NSDate *date;

@property(nonatomic,strong) id opaqueObject;

@end
