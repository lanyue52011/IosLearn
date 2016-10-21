//
//  FavoritesList.h
//  Fonts
//
//  Created by 周登峰 on 7/17/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject

+(instancetype)shareFavoritesList;
-(NSArray *)favorites;
-(void)addFavorite:(id)item;
-(void)removeFavorite:(id)item;

-(void)moveItemAtIndex:(NSInteger)from toIndex:(NSInteger)to;

@end
