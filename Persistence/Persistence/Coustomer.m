//
//  Coustomer.m
//  Persistence
//
//  Created by 周登峰 on 7/31/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "Coustomer.h"

@implementation Coustomer

-(void) encodeWithCoder:(NSCoder *)aCoder{
    //[super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.arr forKey:@"arr"];
    
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.arr=[aDecoder decodeObjectForKey:@"arr"];
    }
    return  self;
}
-(instancetype)copyWithZone:(NSZone *)zone{
    Coustomer *c=[[[self class]allocWithZone:zone] init];
    c.arr=[self.arr copyWithZone:zone];
    
    return c;

}

@end
