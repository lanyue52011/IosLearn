//
//  Coustomer.h
//  Persistence
//
//  Created by 周登峰 on 7/31/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coustomer : NSObject <NSCoding,NSCopying>
@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSArray *arr;
@property(assign,nonatomic) NSInteger myInt;
@end
