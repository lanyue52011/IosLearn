//
//  ContentCell.h
//  DialogViewer
//
//  Created by 周登峰 on 7/19/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UICollectionViewCell

@property(strong,nonatomic) UILabel *label;
@property(copy,nonatomic) NSString *text;
@property(assign,nonatomic) CGFloat maxWidth;

+(CGSize)sizeForContentString:(NSString *) s forMaxWidth:(CGFloat)maxWidth;
@end
