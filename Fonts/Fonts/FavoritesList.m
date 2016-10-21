//
//  FavoritesList.m
//  Fonts
//
//  Created by 周登峰 on 7/17/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "FavoritesList.h"

@interface FavoritesList()

@property(strong,nonatomic) NSMutableArray *favorites;

@end

@implementation FavoritesList

+(instancetype)shareFavoritesList
{
    static FavoritesList *shared=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared=[[FavoritesList alloc] init];
    });
    return shared;
}
-(instancetype)init{
    self=[super init];
    if(self){
        NSUserDefaults *defaults=[NSUserDefaults  standardUserDefaults];
        NSArray *storeFaorites=[defaults objectForKey:@"favorites"];
        if(storeFaorites){
            self.favorites=[storeFaorites mutableCopy];
        }else{
            self.favorites=[NSMutableArray array];
        }
    }
    return self;
}

-(void)addFavorite:(id)item
{
    [_favorites insertObject:item atIndex:0];
    [self saveFavorites];
    
}
-(void)removeFavorite:(id)item
{
    [_favorites removeObject:item];
    [self saveFavorites];
}
-(void)saveFavorites
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favorites forKey:@"favorites"];
    [defaults synchronize];
    
}

-(void)moveItemAtIndex:(NSInteger)from toIndex:(NSInteger)to{
    id item=_favorites[from];
    [_favorites removeObjectAtIndex:from];
    [_favorites insertObject:item atIndex:to];
    [self saveFavorites];
    
}
@end
