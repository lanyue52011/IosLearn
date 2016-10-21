//
//  LayoutAutoDictionary.m
//  Layout
//
//  Created by 周登峰 on 9/5/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "LayoutAutoDictionary.h"
#import <objc/runtime.h>

@interface LayoutAutoDictionary ()

@property(nonatomic,strong) NSMutableDictionary *backingStore;
@end



@implementation LayoutAutoDictionary

@dynamic string,number,date,opaqueObject;

-(instancetype)init{
    if((self=[super init])){
        _backingStore=[NSMutableDictionary new];
    }
    return self;
}
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSString *selectorString=NSStringFromSelector(sel);
    
    if([selectorString hasPrefix:@"set"]){
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    }else{
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "@@:");
    }
    return  YES;
}

id autoDictionaryGetter(id s,SEL _cmd){
    
    LayoutAutoDictionary *typedSelf=(LayoutAutoDictionary *)s;
    NSMutableDictionary *backingStore=typedSelf.backingStore;
    
    NSString *selectString=NSStringFromSelector(_cmd);
    return [backingStore objectForKey:selectString];
    
}

void autoDictionarySetter(id s,SEL _cmd,id v){
    
    LayoutAutoDictionary *typedSelf=(LayoutAutoDictionary *)s;
    NSMutableDictionary *backingStore=typedSelf.backingStore;
    NSString *selectString=NSStringFromSelector(_cmd);
    
    NSMutableString *key=[selectString mutableCopy];
    
    [key deleteCharactersInRange:NSMakeRange(key.length-1, 1)];
    
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    NSString *lowercaseFirstChar=[[key substringFromIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if(v){
        [backingStore setObject:v forKey:key];
    }else{
        [backingStore removeObjectForKey:key];
    }
}


@end
